package controller.login;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.service.MemberService;

@Controller
@SessionAttributes(names = { "member" })
public class LoginController {
	@Autowired
	private MemberService memberService;

	// 登入
	@RequestMapping(path = "/login.login", method = {RequestMethod.POST,RequestMethod.GET},produces= {"application/json"})
	public @ResponseBody String method(String memberId, String password, Model model) {
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// 進行資料檢查
		System.out.println("controller hi");
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		Map<String, String> judgment = new HashMap<String, String>();
		model.addAttribute("judgment", judgment);

		if (memberId == null || memberId.trim().length() == 0) {
			System.out.println("controller memberId");
			errors.put("memberIdError", "請輸入帳號");
		}
		if (password == null || password.trim().length() == 0) {
			System.out.println("controller password");
			errors.put("passwordError", "請輸入密碼");
		}
		if (errors != null && !errors.isEmpty()) {
			System.out.println("controller errors");
			return "login.error";
		}

		// 進行商業服務
		Member bean = memberService.login(memberId, password);
		// 依照執行結果挑選適當的View元件
//		response.getWriter().println(judgment);
		if (bean == null) {
			errors.put("passwordError", "登入失敗");
			judgment.put("judPass", "可以使用此帳號");
			System.out.println("bean1"+bean);
			System.out.println("judgment1"+judgment);
			return "login.error";
		} else {
			model.addAttribute("member", bean);
			judgment.put("judNo", "已有人使用此帳號");
//			response.getWriter().println(judgment);
			System.out.println("bean2"+bean);
			System.out.println("judgment2"+judgment);
//			//角色判斷
//			int role=bean.getRole();
//			switch(role) {
//			//管理員
//			case 1:
//				System.out.println("case1"+role);
//				return "login.success.admin";
//			//一般會員
//			case 2:
//				System.out.println("case2"+role);
//				return "login.success.member";
//			//去註冊	
//			default:
//				System.out.println("case3"+role);
//				return "registy.error";
//			}
			return "";
		}
		

	}
	
	
//1212/	10:33
	@RequestMapping(path = "/login22.login", method = {RequestMethod.POST,RequestMethod.GET},produces= {"application/json"})
	public @ResponseBody  Member  test( @RequestBody Member jsonString) {
		
		System.out.println(jsonString.getMemberId()+jsonString.getPassword());
		Member bean = memberService.login(jsonString.getMemberId(), jsonString.getPassword().toString());
		if(bean!=null) {
//			bean.toString();
			System.out.println("456");
//			System.out.println(bean.toString());
			return bean;
		}else {			
			System.out.println("789");
			return null;
		}
	}
	
	
	
//	public String tojson(Object object) {
//		ObjectMapper mapper=new ObjectMapper();
//		
//		try {
//			return mapper.writeValueAsString(object);
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
	// 登入
//		@RequestMapping(path = "/testlogin.login", method = RequestMethod.POST)
//		public String testmethod(String memberId, String password) {
//			// 讀取使用者輸入資料
//			// 進行必要的資料型態轉換
//			// 進行資料檢查
//			// 進行商業服務
//			Member bean = memberService.login(memberId, password);
//			// 依照執行結果挑選適當的View元件
//			if (bean == null) {
//				errors.put("passwordError", "登入失敗");
//				return "login.error";
//			} else {
//				model.addAttribute("member", bean);
//				//角色判斷
//				int role=bean.getRole();
//				switch(role) {
//				//管理員
//				case 1:
//					return "login.success.admin";
//				//一般會員
//				case 2:
//					return "login.success.member";
//				//去註冊	
//				default:
//					return "registy.error";
//				}
//			}
//		}
	
	
	
	

	// 註冊
	// @InitBinder
	// public void initBinder(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(int.class,new
	// PrimitiveNumberEditor(Integer.class, true));
	// }

	@RequestMapping(path = "/registy.login", method = { RequestMethod.POST })
	public String method2(Member member, BindingResult bindingResult, Model model) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// if(bindingResult!=null && bindingResult.hasErrors()) {
		// errors.put("", "");
		// }
		// 進行資料檢查
		String password = member.getPassword().toString();
		String memberId = member.getMemberId();
		String phone = member.getPhone();
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(password);
		Matcher m2 = p.matcher(memberId);
		// account 8~19 不能有奇怪的字
		if (memberId.length() < 8 || memberId.length() >= 20) {
			errors.put("accountError", "8到19個字之間");
		}else if(m2.find() == true) {
			errors.put("accountError", "不能有特殊字元");
		}
		// password 8~20 不能有奇怪的字
		if (password.length() < 8 || password.length() > 20) {
			errors.put("passwordError", "8到20個字之間");
		}else if (m.find() == true) {
			errors.put("passwordError", "不能有特殊字元");
		}
		// phone = 10
		if (phone.length() < 10 || phone.length() > 10) {
			errors.put("phoneError", "請輸入正確聯絡方式");
		}

		// 帳號 blur 檢查
		Member bean=memberService.login(memberId, null);
		if(bean!=null) {
			errors.put("accountError", "此帳號已被使用");
		}
		// 註冊寄驗證信 time

		// 進行商業服務
		// 依照執行結果挑選適當的View元件
		if (errors!=null && !errors.isEmpty()) {
			System.out.println("gtgtgyg");
			return "registy.error";
		}		
		return "registy.success";
		
	}

}
