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
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.service.MemberService;

@Controller
@SessionAttributes(names = { "member" })
public class LoginController {
	@Autowired
	private MemberService memberService;

	// 登入
	@RequestMapping(path = "/login.login", method = RequestMethod.POST)
	public String method(String memberId, String password, Model model) {
		// 讀取使用者輸入資料
		// 進行必要的資料型態轉換
		// 進行資料檢查
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (memberId == null || memberId.trim().length() == 0) {
			errors.put("memberIdError", "請輸入帳號");
		}
		if (password == null || password.trim().length() == 0) {
			errors.put("passwordError", "請輸入密碼");
		}
		if (errors != null && !errors.isEmpty()) {
			return "login.error";
		}

		// 進行商業服務
		Member bean = memberService.login(memberId, password);
		// 依照執行結果挑選適當的View元件
		if (bean == null) {
			errors.put("passwordError", "登入失敗");
			return "login.error";
		} else {
			model.addAttribute("member", bean);
			return "login.success";
		}

	}

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
