package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.ReplyArticle;
import model.dao.ReplyArticleDAO;

@Service
@Transactional
public class ReplyArticleService {

	@Autowired
	private ReplyArticleDAO replyArticleDAO;

	public List<ReplyArticle> showReplies(int messageId) {
		return replyArticleDAO.selectByMessageId(messageId);
	}
	
	public int replyArticle(ReplyArticle replyArticle) {
		replyArticle.setStatus(0);
		return replyArticleDAO.insert(replyArticle);
	}
	
}
