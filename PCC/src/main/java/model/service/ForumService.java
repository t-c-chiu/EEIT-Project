package model.service;

import java.util.ArrayList;
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
import model.bean.ReportedArticle;
import model.dao.CollectArticleDAO;
import model.dao.PostArticleDAO;
import model.dao.ReplyArticleDAO;
import model.dao.ReportedArticleDAO;

@Service
@Transactional
public class ForumService {

	@Autowired
	private PostArticleDAO postArticleDAO;
	@Autowired
	private ReplyArticleDAO replyArticleDAO;
	@Autowired
	private CollectArticleDAO collectArticleDAO;
	@Autowired
	private ReportedArticleDAO reportedArticleDAO;

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
		postAndReplyArticles.put("repliesCount", replyArticleDAO.selectCountByMessageId(messageId));
		return postAndReplyArticles;
	}

	public List<PostArticle> showArticlesByTopic(String topic) {
		topic = "%" + topic + "%";
		return postArticleDAO.selectByTopic(topic);
	}

	public ReplyArticle replyArticle(Member member, ReplyArticle replyArticle) {
		replyArticle.setMemberId(member.getMemberId());
		replyArticle.setStatus(0);
		replyArticleDAO.insert(replyArticle);
		return replyArticle;
	}

	public String collectArticle(int messageId, String memberId) {
		List<CollectArticle> listOfCollectArticles = collectArticleDAO.selectByMemberId(memberId);

		for (CollectArticle collectArticle : listOfCollectArticles) {
			if (collectArticle.getMessageId() == messageId) {
				PostArticle postArticle = postArticleDAO.selectByMessageId(messageId);
				postArticle.setLikes(postArticle.getLikes() - 1);
				collectArticleDAO.delete(collectArticle);
				return "您已收藏過此文章";
			}
		}

		PostArticle postArticle = postArticleDAO.selectByMessageId(messageId);
		postArticle.setLikes(postArticle.getLikes() + 1);
		CollectArticle collectArticle = new CollectArticle();
		collectArticle.setMessageId(messageId);
		collectArticle.setMemberId(memberId);
		collectArticleDAO.insert(collectArticle);
		return "收藏成功";
	}

	public String modifyArticle(PostArticle article, String contents) {
		article.setContents(contents);
		return postArticleDAO.updateContents(article);
	}

	public List<PostArticle> deleteArticle(PostArticle article) {
		List<ReplyArticle> replies = replyArticleDAO.selectByMessageId(article.getMessageId());
		List<CollectArticle> collects = collectArticleDAO.selectByMessageId(article.getMessageId());
		List<ReportedArticle> reports = reportedArticleDAO.selectByMessageId(article.getMessageId());
		for (CollectArticle collect : collects) {
			collectArticleDAO.delete(collect);
		}
		for (ReplyArticle reply : replies) {
			replyArticleDAO.delete(reply);
		}
		for (ReportedArticle report : reports) {
			reportedArticleDAO.delete(report);
		}
		postArticleDAO.delete(article);
		return showArticleByOrder("date");
	}

	public Integer reportArticle(Member member, String reason, PostArticle article) {
		ReportedArticle reportedArticle = new ReportedArticle();
		reportedArticle.setMemberId(member.getMemberId());
		reportedArticle.setReason(reason);
		reportedArticle.setMessageId(article.getMessageId());
		reportedArticle.setStatus(0);
		postArticleDAO.selectByMessageId(article.getMessageId()).setStatus(1);
		return reportedArticleDAO.insert(reportedArticle);
	}

	public String testCollectBeforeLoad(PostArticle article, Member member) {
		List<CollectArticle> list = collectArticleDAO.selectByMemberId(member.getMemberId());
		for (CollectArticle collectArticle : list) {
			if (collectArticle.getMessageId() == article.getMessageId()) {
				return "取消收藏";
			}
		}
		return "收藏文章";
	}

	public Map<String, Object> showMyArticles(String memberId) {
		List<PostArticle> listOfMyPost = postArticleDAO.selectByMemberId(memberId);
		List<PostArticle> listOfMyReply = new ArrayList<>();
		for (Integer messageId : replyArticleDAO.selectDistinctMessageIdByMemberId(memberId)) {
			listOfMyReply.add(postArticleDAO.selectByMessageId(messageId));
		}
		List<PostArticle> listOfMyCollect = new ArrayList<>();
		for (CollectArticle cArticle : collectArticleDAO.selectByMemberId(memberId)) {
			listOfMyCollect.add(postArticleDAO.selectByMessageId(cArticle.getMessageId()));
		}
		List<Object[]> listOfMyReported = new ArrayList<>();
		for (ReportedArticle rArticle : reportedArticleDAO.selectByMemberId(memberId)) {
			Object[] misc = new Object[] { postArticleDAO.selectByMessageId(rArticle.getMessageId()), rArticle };
			listOfMyReported.add(misc);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("listOfMyPost", listOfMyPost);
		map.put("listOfMyReply", listOfMyReply);
		map.put("listOfMyCollect", listOfMyCollect);
		map.put("listOfMyReported", listOfMyReported);
		return map;
	}
}
