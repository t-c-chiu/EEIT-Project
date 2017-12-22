package controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.service.AdminService;

@Controller
@SessionAttributes({ "all" })
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(path = "/article.admin", method = RequestMethod.GET)
	public String showArticleAdmin(Model model) {
		model.addAttribute("all", adminService.showArticleAdmin());
		return "article";
	}

	@RequestMapping(path = "/showReason.admin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> showReason(Integer messageId, Integer reportId) {
		return adminService.showReason(messageId, reportId);
	}

	@RequestMapping(path = "/showReasons.admin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> showReasons(Integer messageId) {
		return adminService.showReasons(messageId);
	}

	@RequestMapping(path = "/blackArticle.admin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String blackArticle(Integer messageId) {
		return adminService.blackArticle(messageId);
	}

}
