package controller.forum;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.bean.Member;
import model.bean.PostArticle;
import model.bean.ReplyArticle;
import model.service.PostArticleService;
import model.service.ReplyArticleService;

@Controller
@SessionAttributes(value = { "bean" })
public class ForumController {

	@Autowired
	PostArticleService postArticleService;
	@Autowired
	ReplyArticleService replyArticleService;

	@InitBinder
	public void init(WebDataBinder binder) {
		binder.registerCustomEditor(byte[].class, "photo", new ByteArrayMultipartFileEditor());
	}

	@RequestMapping(path = "/post.forum", method = RequestMethod.POST)
	public String postArticle(@SessionAttribute("member") Member member, PostArticle bean, Model model) {
		bean.setMemberId(member.getMemberId());
		System.out.println(bean);
		int messageId = postArticleService.postArticle(bean);
		if (messageId == -1) {
			return "post.err";
		}
		model.addAttribute("bean", bean);
		return "post.ok";
	}

	@RequestMapping(path = "/showAll.forum", method = RequestMethod.GET)
	public String showAllArticles(String category, Model model) {
		List<PostArticle> listOfPostArticles;
		if ("all".equalsIgnoreCase(category)) {
			listOfPostArticles = postArticleService.showAllArticles();
		} else {
			listOfPostArticles = postArticleService.showArticlesByCategory(category);
		}
		model.addAttribute("listOfPostArticles", listOfPostArticles);
		return "showArticles";
	}

	@RequestMapping(path = "/showDetial.forum", method = RequestMethod.GET)
	public String showArticleDetail(int messageId, Model model) {
		PostArticle article = postArticleService.showArticleDetail(messageId);
		model.addAttribute("mainArticle", article);
		return "articleDetail";
	}

	@RequestMapping(path = "/reply.forum", method = RequestMethod.POST)
	public String replyArticle(@SessionAttribute("member") Member member, ReplyArticle replyArticle) {
		replyArticle.setMemberId(member.getMemberId());
		System.out.println(replyArticle);
		return "";
	}
}
