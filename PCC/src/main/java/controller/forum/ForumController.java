package controller.forum;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(path = "/reply.forum", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public @ResponseBody ReplyArticle replyArticle(@SessionAttribute("member") Member member,
			ReplyArticle replyArticle) {
		return forumService.replyArticle(member, replyArticle);
	}

	@RequestMapping(path = "/collect.forum", method = RequestMethod.GET, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String collectArticle(@SessionAttribute("member") Member member,
			@SessionAttribute("detail") Map<String, Object> detail) {
		PostArticle article = (PostArticle) detail.get("post");
		return forumService.collectArticle(article.getMessageId(), member.getMemberId());
	}

	@RequestMapping(path = "/testCollect.forum", method = RequestMethod.GET, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String testCollectBeforeLoad(@SessionAttribute("member") Member member,
			@SessionAttribute("detail") Map<String, Object> detail) {
		return forumService.testCollectBeforeLoad((PostArticle) detail.get("post"), member);
	}

	@RequestMapping(path = "/modify.forum", method = RequestMethod.POST, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String modifyArticle(@SessionAttribute("detail") Map<String, Object> detail, String contents) {
		return forumService.modifyArticle((PostArticle) detail.get("post"), contents);
	}

	@RequestMapping(path = "/delete.forum", method = RequestMethod.DELETE, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String deleteArticle(@SessionAttribute("detail") Map<String, Object> detail) {
		forumService.deleteArticle((PostArticle) detail.get("post"));
		return "刪除成功";
	}

	@RequestMapping(path = "/report.forum", method = RequestMethod.POST, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String reportArticle(String reason, @SessionAttribute("member") Member member,
			@SessionAttribute("detail") Map<String, Object> detail) {
		forumService.reportArticle(member, reason, (PostArticle) detail.get("post"));
		return "檢舉成功";
	}

	@RequestMapping(path = "/isOKtoPost.forum", method = RequestMethod.GET, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String isOKtoPost(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "請先登入";
		}
		if (member.getStatus() == 1) {
			return "您已被禁止發文";
		}
		return "OK";
	}

}
