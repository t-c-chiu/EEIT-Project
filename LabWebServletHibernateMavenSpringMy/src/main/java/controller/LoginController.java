package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.CustomerBean;
import model.CustomerService;

@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/secure/login.controller")
	public String doshit(String username, String password, Model model) {
		Map<String, String> errors = new HashMap<>();

		model.addAttribute("errors", errors);
		if (username == null || username.trim().length() == 0) {
			errors.put("username", "請輸入帳號");
		}
		if (password == null || password.trim().length() == 0) {
			errors.put("password", "請輸入密碼");
		}
		if (!errors.isEmpty()) {
			return "login.err";
		}

		CustomerBean bean = customerService.login(username, password);
		if (bean == null) {
			errors.put("password", "登入失敗");
			return "login.err";
		} else {
			model.addAttribute("user", bean);
			return "login.ok";
		}
	}

}
