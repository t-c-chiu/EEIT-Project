package controller.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(path = "/test.login", method = RequestMethod.POST)
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

}
