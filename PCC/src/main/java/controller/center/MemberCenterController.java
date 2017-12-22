package controller.center;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.bean.Member;
import model.service.MemberCenterService;
import model.service.MemberService;

@Controller
public class MemberCenterController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberCenterService memberCenterService;
	
	@RequestMapping(path="/membercenter.center",method= {RequestMethod.POST},produces= {"application/json;charset=utf-8"})
	public String method(@SessionAttribute("member") Member member,Model model) {
//		System.out.println(member);
//		
//		member.getMemberId();
		
//		Map<String,String> personal =new HashMap();
//		model.addAttribute("personal",personal);
//		
//		if(member!=null){
//			personal.put("name", "");
//			return "";
//		}
//		
		return null;
	}

}
