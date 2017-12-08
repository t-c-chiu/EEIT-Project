package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.CollectArticle;
import model.bean.PostArticle;
import model.dao.CollectArticleDAO;
import model.dao.PostArticleDAO;

@Service
@Transactional
public class CollectArticleService {

	@Autowired
	private CollectArticleDAO collectArticleDAO;
	@Autowired
	private PostArticleDAO postArticleDAO;

	public int collectArticle(int messageId, String memberId) {
		List<CollectArticle> listOfCollectArticles = collectArticleDAO.selectByMemberId(memberId);
		for (CollectArticle article : listOfCollectArticles) {
			if (article.getMessageId() == messageId) {
				return -1;
			}
		}
		PostArticle article = postArticleDAO.selectByMessageId(messageId);
		article.setLikes(article.getLikes() + 1);
		CollectArticle collectArticle = new CollectArticle();
		collectArticle.setMessageId(messageId);
		collectArticle.setMemberId(memberId);
		return collectArticleDAO.insert(collectArticle);
	}

	public int showCollectCount(int messageId) {
		return collectArticleDAO.selectCountByMessageId(messageId);
	}
}
