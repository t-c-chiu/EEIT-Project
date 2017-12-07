package controller.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.PostArticle;
import model.service.PostArticleService;

@Controller
public class ShowForumController {

	@Autowired
	private PostArticleService postArticleService;

	@RequestMapping(path = "/showAll.forum", method = RequestMethod.GET)
	public String showAll(String category, Model model) {
		List<PostArticle> listOfPostArticles;
		if ("all".equalsIgnoreCase(category)) {
			listOfPostArticles = postArticleService.showAllArticles();
		} else {
			listOfPostArticles = postArticleService.showArticlesByCategory(category);
		}
		model.addAttribute("listOfPostArticles", listOfPostArticles);
		return "showArticles";
	}

}
