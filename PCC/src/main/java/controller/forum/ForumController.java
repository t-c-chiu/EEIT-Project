package controller.forum;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import model.service.CollectArticleService;
import model.service.PostArticleService;
import model.service.ReplyArticleService;

@Controller
@SessionAttributes({ "listOfPostArticles" })
public class ForumController {

	@Autowired
	PostArticleService postArticleService;
	@Autowired
	ReplyArticleService replyArticleService;
	@Autowired
	CollectArticleService collectArticleService;

	@RequestMapping(path = "/post.forum", method = RequestMethod.POST)
	public String postArticle(@SessionAttribute("member") Member member, PostArticle bean, Model model) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		if (bean.getTopic() == null || bean.getTopic().trim().length() == 0) {
			errors.put("topic", "請輸入主題");
		}
		if (bean.getContents() == null || bean.getContents().trim().length() == 0) {
			errors.put("contents", "請輸入內容");
		}
		if (errors != null && !errors.isEmpty()) {
			return "postArticle";
		}
		bean.setMemberId(member.getMemberId());
		postArticleService.postArticle(bean);
		model.addAttribute("listOfPostArticles", postArticleService.showArticleByOrder("date"));
		return "showArticles";
	}

	@RequestMapping(path = "/showByOrder.forum", method = RequestMethod.GET)
	public String showArticlesByOrder(String order, Model model) {
		List<PostArticle> listOfPostArticles = postArticleService.showArticleByOrder(order);
		model.addAttribute("listOfPostArticles", listOfPostArticles);
		return "showArticles";
	}

	@RequestMapping(path = "/showAll.forum", method = RequestMethod.GET)
	public String showArticles(String category, Model model) {
		List<PostArticle> listOfPostArticles = postArticleService.showArticlesByCategory(category);
		model.addAttribute("listOfPostArticles", listOfPostArticles);
		return "showArticles";
	}

	@RequestMapping(path = "/showDetial.forum", method = RequestMethod.GET)
	public String showArticleDetail(Integer messageId, Model model) {
		model.addAttribute("mainArticle", postArticleService.showArticleDetail(messageId));
		model.addAttribute("replyArticles", showAllReplyArticles(messageId));
		return "articleDetail";
	}

	@RequestMapping(path = "/reply.forum", method = RequestMethod.POST)
	public String replyArticle(@SessionAttribute("member") Member member, ReplyArticle replyArticle, Model model) {
		Integer messageId = replyArticle.getMessageId();
		model.addAttribute("mainArticle", postArticleService.showArticleDetail(messageId));
		model.addAttribute("replyArticles", showAllReplyArticles(messageId));
		if (replyArticle.getContents() == null || replyArticle.getContents().trim().length() == 0) {
			model.addAttribute("replyMsg", "請輸入留言");
			return "articleDetail";
		}
		replyArticle.setMemberId(member.getMemberId());
		replyArticleService.replyArticle(replyArticle);
		model.addAttribute("replyArticles", showAllReplyArticles(messageId));
		return "articleDetail";
	}

	@RequestMapping(path = "/collect.forum", method = RequestMethod.GET)
	public String collectArticle(Integer messageId, String memberId, Model model) throws IOException {
		int collect = collectArticleService.collectArticle(messageId, memberId);
		model.addAttribute("mainArticle", postArticleService.showArticleDetail(messageId));
		model.addAttribute("replyArticles", showAllReplyArticles(messageId));
		if (collect == -1) {
			model.addAttribute("isCollect", "您已收藏過本文章");
		} else {
			model.addAttribute("isCollect", "收藏成功");
		}
		return "articleDetail";
	}

	@RequestMapping(path = "/search.forum", method = RequestMethod.GET)
	public String searchArticles(String topic, Model model) {
		List<PostArticle> articles = postArticleService.showArticlesByTopic(topic);
		model.addAttribute("listOfPostArticles", articles);
		return "showArticles";
	}

	public List<ReplyArticle> showAllReplyArticles(Integer messageId) {
		return replyArticleService.showReplies(messageId);
	}
}
