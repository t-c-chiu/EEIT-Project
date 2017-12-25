package controller.login;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import model.service.MemberService;
import model.service.RegistyService;

@Controller
@SessionAttributes(names = { "member" })
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private RegistyService registyService;

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
		System.out.println(memberId + password);
		Member bean = memberService.login(memberId, password);
		// 依照執行結果挑選適當的View元件
		if (bean == null) {
			errors.put("passwordError", "登入失敗");
			System.out.println("hino");
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
//		System.out.println("12345678");
//		model.addAttribute("member",null);
		Enumeration<String> em = session.getAttributeNames();
		System.out.println(session.getAttribute("yyyy="+"member"));
		while(em.hasMoreElements()){
			session.removeAttribute("member");
		System.out.println(session.getAttribute("nnnn="+"member"));
		
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
		// String regEx =
		// "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";

		// 帳號 blur 檢查memberId
		if (memberId == null || memberId.trim().length() == 0) {
			// System.out.println("memberId沒輸入阿");
			return "不可空白";
		} else if (memberId.length() > 20 || memberId.length() < 8) {
			return "8~19個英文或數字";
		}
		Member bean = registyService.checkMemberId(memberId);
		if (bean != null) {
			errors.put("accountError", "此帳號已被使用");
			// System.out.println("bean有東西");
			return "不可使用的帳號";
		}
		// System.out.println("可用的");
		return "可以註冊";

	}

	@RequestMapping(path = "/registy.insert.login", method = { RequestMethod.POST }, produces = {"text/plain;charset=utf-8" })
	public @ResponseBody String method3(Member member, Model model) {
		if (member != null) {
			Member bean = registyService.registy(member);
			return "成功註冊";
		}
		return "註冊失敗";

		// 12/15
		// 把登入跟註冊的controller分開寫，才不會取到登入的 memberId 的 session
		// 還有 註冊成功的時候 並不會跳出 alert 居然直接轉跳!!m

	}
	@RequestMapping(path="/personal.update.login",method= {RequestMethod.POST},produces= {"application/json;charset=utf-8"})
	public @ResponseBody Member method4(Member member,Model model) {
		System.out.println("hi controller"+member);
		if(member!=null) {
			Member bean = memberService.updatePersonal(member);
			System.out.println("controllerbean="+bean);
			return bean;
		}
		
		return null;
	}

}
