package controller.login;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.PointDetails;
import model.dao.SystemMessageDAO;
import model.service.MemberCenterService;
import model.service.MemberService;
import model.service.RegistyService;

@Controller
@SessionAttributes(names = { "member","admin", "servant"})
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private RegistyService registyService;
	@Autowired
	private MemberCenterService memberCenterService;
	@Autowired
	private SystemMessageDAO systemMessageDAO;

	// 登入 成功版
	@RequestMapping(path = "/login.login", method = { RequestMethod.POST, RequestMethod.GET }, produces = {
			"text/plain;charset=utf-8" })
	public @ResponseBody String method(String memberId, String password, Model model) {
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// 進行資料檢查
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		// 進行商業服務
//		System.out.println(memberId + password);
		Member bean = memberService.login(memberId, password);
		// 依照執行結果挑選適當的View元件
		if (bean == null) {
			errors.put("passwordError", "登入失敗");
			return "登入失敗";
		} else {
			// 角色判斷
			int role = bean.getRole();
			switch (role) {
			// 管理員
			case 1:
				model.addAttribute("admin", bean);
				return "管理員";
			// 一般會員
			case 2:			
				model.addAttribute("member", bean);
				return "會員";
			// 服務員
			case 3:
				model.addAttribute("servant", bean);
				return "會員";
			// 不是會員
			default:
				model.addAttribute("default", bean);
				return "不是會員";
			}

		}

	}
	
	@RequestMapping(path="/logout.login", method = { RequestMethod.POST, RequestMethod.GET }, produces = {
	"text/plain;charset=utf-8" })
	public @ResponseBody String initSession(Model model,HttpSession session) {
//		model.addAttribute("member",null);
		Enumeration em = session.getAttributeNames();
		if(em.hasMoreElements()){
			session.removeAttribute("member");
			model.addAttribute("member",null);
		return "登出";
		}
		return "不登出";
	}

	// 註冊
	// @InitBinder
	// public void initBinder(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(int.class,new
	// PrimitiveNumberEditor(Integer.class, true));
	// }

	@RequestMapping(path = "/registy.login", method = { RequestMethod.POST }, produces = { "text/plain;charset=utf-8" })
	public @ResponseBody String method2(Member member, BindingResult bindingResult, Model model) {
		// System.out.println(member);
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		String memberId = member.getMemberId();
		// 帳號 blur 檢查memberId
		if (memberId == null || memberId.trim().length() == 0) {
			return "不可空白";
		} else if (memberId.length() > 20 || memberId.length() < 8) {
			return "8~19個英文或數字";
		}
		Member bean = registyService.checkMemberId(memberId);
		if (bean != null) {
			errors.put("accountError", "此帳號已被使用");
			return "不可使用的帳號";
		}
		return "可以註冊";

	}

	@RequestMapping(path = "/registy.insert.login", method = { RequestMethod.POST }, produces = {"text/plain;charset=utf-8" })
	public @ResponseBody String method3(Member member, PointDetails pointDetails,Model model) {
		if (member != null) {
			Member bean = registyService.registy(member);
			pointDetails.setMemberId(member.getMemberId());
			registyService.insertMemberFirstTime(pointDetails);
			return "成功註冊";
		}
		return "註冊失敗";
	}
	
	@RequestMapping(path="/personal.update.login",method= {RequestMethod.POST},produces= {"application/json;charset=utf-8"})
	public @ResponseBody Member method4(Member member,Model model) {
		if(member!=null) {
			Member bean = memberService.updatePersonal(member);
			return bean;
		}
		
		return null;

	}

	@RequestMapping(path= {"/changePassword.login"},method = {RequestMethod.POST,RequestMethod.GET},produces = {"text/plain;charset=utf-8"})
	public @ResponseBody String method5(Member member,String oldPassword, String newPassword,HttpSession session) {
		//取得 member 的 email
		Member themember= (Member)session.getAttribute("member");
		String memberId=themember.getMemberId();
		String email=themember.getEmail();
		System.out.println("member / Email = "+memberId+"/"+email);
		Member bean=memberService.login(memberId, oldPassword);
		System.out.println("up="+oldPassword+"/"+newPassword);
		if(bean !=null) {
			//update new password
			member.setPassword(newPassword.getBytes());
			member=memberCenterService.updatePSW(member);
			//寄信
			String title="PCC會員密碼更改通知";
			String body="<h2>PCC會員  "+memberId+" 已更改會員密碼</h2><br><h4>如有任何問題，請透過官方網站查詢、或與我們連絡 </h4><h4><a href='http://192.168.40.10:8080/PCC/index.jsp' style='background-color:#EB7C81;color:#fff;padding:5%;'>前往PCC官網確認</a></h4><br><h6>Postnatal Care Center 敬上</h6>";
			EmailUtil.sendEmail(email, title, body, null);
			//日期轉格式
//			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
//			Date current = new Date();
//			System.out.println(sdFormat.format(current));
			//寄系統信
			systemMessageDAO.insert(memberId, "會員密碼更改", "會員"+memberId+"更改密碼成功");
			
			return "更改密碼成功";
		}

		return "密碼不正確";
	}

	
}
