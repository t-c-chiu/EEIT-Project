package controller.forum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.bean.PostArticle;
import model.service.PostArticleService;

@Controller
@SessionAttributes(value = { "bean" })
public class PostArticleController {

	@Autowired
	PostArticleService postArticleService;

	@InitBinder
	public void init(WebDataBinder binder) {
		binder.registerCustomEditor(byte[].class, "photo", new ByteArrayMultipartFileEditor());
	}

	@RequestMapping(path = "/post.forum", method = RequestMethod.POST)
	public String postArticle(PostArticle bean, Model model) {
		bean.setMemberId("Account");
		System.out.println(bean);
		int messageId = postArticleService.postArticle(bean);
		if (messageId == -1) {
			return "post.err";
		}
		model.addAttribute("bean", bean);
		return "post.ok";
	}
}
