package model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.CollectArticle;
import model.bean.Member;
import model.bean.PostArticle;
import model.bean.ReplyArticle;
import model.dao.CollectArticleDAO;
import model.dao.PostArticleDAO;
import model.dao.ReplyArticleDAO;

@Service
@Transactional
public class ForumService {

	@Autowired
	private PostArticleDAO postArticleDAO;
	@Autowired
	private ReplyArticleDAO replyArticleDAO;
	@Autowired
	private CollectArticleDAO collectArticleDAO;

	public List<PostArticle> postArticle(Member member, PostArticle postArticle) {
		postArticle.setMemberId(member.getMemberId());
		postArticle.setLikes(0);
		postArticle.setStatus(0);
		postArticleDAO.insert(postArticle);
		return showArticleByOrder("date");
	}

	public List<PostArticle> showArticleByOrder(String order) {
		return postArticleDAO.selectOrderBy(order);
	}

	public List<PostArticle> showArticlesByCategory(String category) {
		return postArticleDAO.selectByCategory(category);
	}

	public Map<String, Object> showArticleDetail(Integer messageId) {
		Map<String, Object> postAndReplyArticles = new HashMap<>();
		postAndReplyArticles.put("post", postArticleDAO.selectByMessageId(messageId));
		postAndReplyArticles.put("reply", replyArticleDAO.selectByMessageId(messageId));
		return postAndReplyArticles;
	}

	public List<PostArticle> showArticlesByTopic(String topic) {
		topic = "%" + topic + "%";
		return postArticleDAO.selectByTopic(topic);
	}

	public Map<String, Object> replyArticle(Member member, ReplyArticle replyArticle) {
		replyArticle.setMemberId(member.getMemberId());
		replyArticle.setStatus(0);
		replyArticleDAO.insert(replyArticle);
		return showArticleDetail(replyArticle.getMessageId());
	}

	public Map<String, Object> collectArticle(int messageId, String memberId) {
		List<CollectArticle> listOfCollectArticles = collectArticleDAO.selectByMemberId(memberId);
		Map<String, Object> postAndReplyArticles = showArticleDetail(messageId);
		for (CollectArticle article : listOfCollectArticles) {
			if (article.getMessageId() == messageId) {
				postAndReplyArticles.put("collectMsg", "您已收藏過此文章");
				return postAndReplyArticles;
			}
		}

		PostArticle article = postArticleDAO.selectByMessageId(messageId);
		article.setLikes(article.getLikes() + 1);

		CollectArticle collectArticle = new CollectArticle();
		collectArticle.setMessageId(messageId);
		collectArticle.setMemberId(memberId);
		collectArticleDAO.insert(collectArticle);
		postAndReplyArticles.put("collectMsg", "收藏成功");
		return postAndReplyArticles;
	}

}
