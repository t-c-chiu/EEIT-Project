package controller.match;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.Reservation;
import model.service.MatchService;

@Controller
@SessionAttributes({"servantList","fullServantList"})
public class MatchController {
	@Autowired
	public MatchService service;

	@InitBinder
	public void init(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	// 服務夥伴清單(清單上沒按鈕)
	@RequestMapping(path = "/servantList.match", method = RequestMethod.GET)
	public String method(Model model) {
		List<List> servantList = service.showServantList();
		model.addAttribute("servantList", servantList);
		return "showServantList";
	}

	// 訊息清單(每秒刷新)
	@RequestMapping(path = "/ChatList.match", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public @ResponseBody String method1() {
		String result = service.ChatList();
		return result;
	}

	// 傳送訊息(到訊息清單)
	@RequestMapping(path = "/SendContent.match", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public @ResponseBody String method2(String content, HttpSession session) {
		Boolean res = service.SendContent(content, session);
		String result = "1";
		return result;
	}

	// 線上預約(正式服務夥伴清單)
	@RequestMapping(path = "/fullServantList.match", method = RequestMethod.GET)
	public String method3(@SessionAttribute("member") Member member, Model model) {
         Boolean isComplete = service.CompleteReservationForm(member.getMemberId());
         if (isComplete) {
        	 List<List> servantList = service.showServantList();
    		 model.addAttribute("fullServantList", servantList);
    		 return "showFullServantList";
		 }         
         return "reservationForm";
	}

	// 新申請預約表(成功後跳轉到正式服務夥伴清單)
	@RequestMapping(path = "/submitReservationForm.match", method = RequestMethod.POST)
	public String method4(Reservation reservation, Model model, @SessionAttribute("member") Member member) {
		 reservation.setMemberId(member.getMemberId());
		 service.insertReservationForm(reservation);
		 List<List> servantList = service.showServantList();
		 model.addAttribute("fullServantList", servantList);
		 return "showFullServantList";
	}

	// 選擇服務員
	@RequestMapping(path = "/chooseServant.match", method = RequestMethod.GET)
	public String method5(String servantId, @SessionAttribute("member") Member member) {
		System.out.println(servantId);
		Boolean isMatch = service.matching(member.getMemberId(), Integer.parseInt(servantId));
		System.out.println(isMatch);
		return "memberCenter";
	}
	
	// 選擇服務員對話id
	@RequestMapping(path = "/servantIdList.match", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
	public @ResponseBody List<String> method6(@SessionAttribute("member") Member member) {
		return service.selectServantName(member.getMemberId());
	}
	
	
}
