package controller.forum;

import java.util.Map;

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
@SessionAttributes({ "listOfPostArticles", "detail" })
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
		model.addAttribute("listOfPostArticles", forumService.showArticlesByTopic(topic.trim()));
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
	public String collectArticle(@SessionAttribute("member") Member member,
			@SessionAttribute("detail") Map<String, Object> detail, Model model) {
		PostArticle article = (PostArticle) detail.get("post");
		model.addAttribute("detail", forumService.collectArticle(article.getMessageId(), member.getMemberId()));
		return "articleDetail";
	}

	@RequestMapping(path = "/modify.forum", method = RequestMethod.POST)
	public String modifyArticle(@SessionAttribute("detail") Map<String, Object> detail, String contents, Model model) {
		model.addAttribute("detail", forumService.modifyArticle((PostArticle) detail.get("post"), contents));
		return "articleDetail";
	}

	@RequestMapping(path = "/delete.forum", method = RequestMethod.GET)
	public String deleteArticle(@SessionAttribute("detail") Map<String, Object> detail, Model model) {
		model.addAttribute("listOfPostArticles", forumService.deleteArticle((PostArticle) detail.get("post")));
		return "showArticles";
	}

	@RequestMapping(path = "/report.forum", method = RequestMethod.GET)
	public String reportArticle(String reason, @SessionAttribute("member") Member member,
			@SessionAttribute("detail") Map<String, Object> detail, Model model) {
		forumService.reportArticle(member, reason, (PostArticle) detail.get("post"));
		System.out.println(reason);
		return null;
	}
}
