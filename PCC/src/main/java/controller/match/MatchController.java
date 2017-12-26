package controller.match;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.Reservation;
import model.bean.Servant;
import model.service.MatchService;

@Controller
@SessionAttributes({ "servantList", "fullServantList" })
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
		List<Servant> servantList = service.showServantList();
		model.addAttribute("servantList", servantList);
		return "showServantList";
	}

	// 線上預約(正式服務夥伴清單)
	@RequestMapping(path = "/fullServantList.match", method = RequestMethod.GET)
	public String method3(@SessionAttribute("member") Member member, Model model) {
		Boolean isComplete = service.completeReservationForm(member.getMemberId());
		if (isComplete) {
			List<Servant> servantList = service.showServantList();
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
		List<Servant> servantList = service.showServantList();
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

	// 選擇服務員資訊
	@RequestMapping(path = "/idInformation.match", method = RequestMethod.POST)
	public @ResponseBody Object method6(HttpSession session, String memId) {
		Member member = (Member) session.getAttribute("member");
		Servant servant = (Servant) session.getAttribute("servant");
		return service.idInformation(member, memId, servant);
	}

}
