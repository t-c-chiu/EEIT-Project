package controller.forum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.PostArticle;
import model.service.PostArticleService;

@Controller
public class ShowArticleDetailController {

	@Autowired
	private PostArticleService postArticleService;

	@RequestMapping(path = "/showDetial.forum", method = RequestMethod.GET)
	public String showTime(int messageId,Model model) {
		PostArticle article = postArticleService.showArticleDetail(messageId);
		model.addAttribute("article", article);
		return "articleDetail";
	}

}
