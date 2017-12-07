package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.ReplyArticle;
import model.dao.ReplyArticleDAO;

@Service
public class ReplyArticleService {

	@Autowired
	private ReplyArticleDAO replyArticleDAO;

	public List<ReplyArticle> showReplies(int messageId) {
		return replyArticleDAO.selectByMessageId(messageId);
	}
	
	public int replyArticle(ReplyArticle replyArticle) {
		return replyArticleDAO.insert(replyArticle);
	}
}
