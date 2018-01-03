package controller.match;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
	public MatchService matchService;

	@InitBinder
	public void init(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	// 服務夥伴清單(清單上沒按鈕)
	@RequestMapping(path = "/servantList.match", method = RequestMethod.GET)
	public String servantList(Model model) {
		List<Servant> servantList = matchService.showServantList();
		model.addAttribute("servantList", servantList);
		return "showServantList";
	}

	// 線上預約(正式服務夥伴清單)
	@RequestMapping(path = "/fullServantList.match", method = RequestMethod.GET)
	public String fullServantList(HttpSession session, Model model, HttpServletResponse response) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			try {
				response.sendRedirect("/PCC/servantList.match");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		Boolean isComplete = matchService.completeReservationForm(member.getMemberId());
		if (isComplete) {
			List<Servant> servantList = matchService.showServantList();
			model.addAttribute("fullServantList", servantList);
			return "showFullServantList";
		}
		return "reservationForm";
	}

	// 新申請預約表(成功後跳轉到正式服務夥伴清單)
	@RequestMapping(path = "/submitReservationForm.match", method = RequestMethod.POST)
	public String submitReservationForm(Reservation reservation, Model model,
			@SessionAttribute("member") Member member) {
		reservation.setMemberId(member.getMemberId());
		matchService.insertReservationForm(reservation);
		List<Servant> servantList = matchService.showServantList();
		model.addAttribute("fullServantList", servantList);
		return "showFullServantList";
	}

	// 選擇服務員
	@RequestMapping(path = "/chooseServant.match", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String chooseServant(Integer serviceId, @SessionAttribute("member") Member member) {
		return matchService.matching(member.getMemberId(), serviceId);
	}

	@RequestMapping(path = "/showMyMatching.match", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Object[]> showMyMatching(@SessionAttribute("member") Member member) {
		return matchService.showMyMatching(member.getMemberId());
	}

}
