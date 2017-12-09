package controller.forum;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.PostArticle;
import model.bean.ReplyArticle;
import model.service.ForumService;

@Controller
@SessionAttributes({ "listOfPostArticles" })
public class ForumController {

	@Autowired
	private ForumService forumService;

	@RequestMapping(path = "/post.forum", method = RequestMethod.POST)
	public String postArticle(@SessionAttribute("member") Member member, PostArticle bean, Model model) {
		model.addAttribute("listOfPostArticles", forumService.postArticle(member, bean));
		return "showArticles";
	}

	@RequestMapping(path = "/showByOrder.forum", method = RequestMethod.GET)
	public String showArticlesByOrder(String order, Model model) {
		model.addAttribute("listOfPostArticles", forumService.showArticleByOrder(order));
		return "showArticles";
	}

	@RequestMapping(path = "/showAll.forum", method = RequestMethod.GET)
	public String showArticles(String category, Model model) {
		model.addAttribute("listOfPostArticles", forumService.showArticlesByCategory(category));
		return "showArticles";
	}

	@RequestMapping(path = "/search.forum", method = RequestMethod.GET)
	public String searchArticles(String topic, Model model) {
		model.addAttribute("listOfPostArticles", forumService.showArticlesByTopic(topic));
		return "showArticles";
	}

	@RequestMapping(path = "/showDetial.forum", method = RequestMethod.GET)
	public String showArticleDetail(Integer messageId, Model model) {
		model.addAttribute("detail", forumService.showArticleDetail(messageId));
		return "articleDetail";
	}

	@RequestMapping(path = "/reply.forum", method = RequestMethod.POST)
	public String replyArticle(@SessionAttribute("member") Member member, ReplyArticle replyArticle, Model model) {
		model.addAttribute("detail", forumService.replyArticle(member, replyArticle));
		return "articleDetail";
	}

	@RequestMapping(path = "/collect.forum", method = RequestMethod.GET)
	public String collectArticle(Integer messageId, String memberId, Model model) throws IOException {
		model.addAttribute("detail", forumService.collectArticle(messageId, memberId));
		return "articleDetail";
	}

}
