package controller.login;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	@RequestMapping(path = "/login.login", method = { RequestMethod.POST }, produces = { "text/plain;charset=utf-8" })
	public @ResponseBody String method(String memberId, String password, Model model) {
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// 進行資料檢查
		// String memberId=member.getMemberId();
		// String password=member.getPassword().toString();
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		// Map<String, String> judgment = new HashMap<String, String>();
		// model.addAttribute("judgment", judgment);

		// if (memberId == null || memberId.trim().length() == 0) {
		// System.out.println("controller memberId");
		// errors.put("memberIdError", "請輸入帳號");
		// }
		// if (password == null || password.trim().length() == 0) {
		// System.out.println("controller password");
		// errors.put("passwordError", "請輸入密碼");
		// }
		// //成功 都有填的話
		// if (errors != null && !errors.isEmpty()) {
		// System.out.println("controller errors");
		// return "login.error";
		// }

		// 進行商業服務
		Member bean = memberService.login(memberId, password);
		// 依照執行結果挑選適當的View元件
		// response.getWriter().println(judgment);
		if (bean == null) {
			errors.put("passwordError", "登入失敗");
			// judgment.put("judPass", "可以使用此帳號");
			// System.out.println("judgment1"+judgment);
			return "登入失敗";
		} else {
			// model.addAttribute("member", bean);
			// judgment.put("judNo", "已有人使用此帳號");
			// response.getWriter().println(judgment);
			// System.out.println("bean2"+bean);
			// System.out.println("judgment2"+judgment);
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

	// 1212/ 10:33 測試傳JSON進來
	// @RequestMapping(path = "/login22.login", method =
	// {RequestMethod.POST,RequestMethod.GET},produces= {"application/json"})
	// public @ResponseBody Member test( @RequestBody Member jsonString) {
	//
	// System.out.println(jsonString.getMemberId()+jsonString.getPassword());
	// Member bean = memberService.login(jsonString.getMemberId(),
	// jsonString.getPassword().toString());
	// if(bean!=null) {
	//// bean.toString();
	// System.out.println("456");
	//// System.out.println(bean.toString());
	// return bean;
	// }else {
	// System.out.println("789");
	// return null;
	// }
	// }

	// 註冊
	// @InitBinder
	// public void initBinder(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(int.class,new
	// PrimitiveNumberEditor(Integer.class, true));
	// }

	@RequestMapping(path = "/registy.login", method = { RequestMethod.POST }, produces = { "text/plain;charset=utf-8" })
	public @ResponseBody String method2(Member member, BindingResult bindingResult, Model model) {
		System.out.println(member);
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// if(bindingResult!=null && bindingResult.hasErrors()) {
		// errors.put("", "");
		// }
		// 進行資料檢查
		// String password = member.getPassword().toString();
		String memberId = member.getMemberId();
		String phone = member.getPhone();
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		// Matcher m = p.matcher(password);
		Matcher m2 = p.matcher(memberId);
		// 帳號 blur 檢查
		// Member bean=memberService.login(memberId, password);
		if (memberId == null || memberId.trim().length() == 0) {
			System.out.println("memberId沒輸入阿");
			return "不可空白";
		}else if(memberId.length()>20 || memberId.length()<8) {
//			for(int i=0;i<memberId.length();i++) {
//				
//			}
			return "8~19個英文或數字";
		}
		Member bean = registyService.checkMemberId(memberId);
		if (bean != null) {
			errors.put("accountError", "此帳號已被使用");
			System.out.println("bean有東西");
			return "不可使用的帳號";
		}
		// 註冊寄驗證信 time

		// 進行商業服務
		// 依照執行結果挑選適當的View元件
		// if (errors!=null && !errors.isEmpty()) {
		// System.out.println("gtgtgyg");
		// return "註冊失敗";
		// }
//		if() {
//			
//		}
		System.out.println("可用的");
		return "可以註冊";

	}

}
