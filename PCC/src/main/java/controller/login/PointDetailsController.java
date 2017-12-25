package controller.login;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.PointDetails;
import model.service.PointDetailsService;

@Controller
@SessionAttributes
public class PointDetailsController {
	@Autowired
	private PointDetailsService pointDetailsService;
 
	@RequestMapping(path= {"/pointDetails.login" },method= {RequestMethod.GET},produces= {"application/json;charset=utf-8"})
	public @ResponseBody List<PointDetails> method(HttpSession session,Model model) {
		Member member=(Member)session.getAttribute("member");
		 List<PointDetails> details = pointDetailsService.select(member.getMemberId());
		return details;
	}

}
