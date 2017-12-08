package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.CollectArticle;
import model.dao.CollectArticleDAO;

@Service
@Transactional
public class CollectArticleService {

	@Autowired
	private CollectArticleDAO collectArticleDAO;

	public int collectArticle(int messageId, String memberId) {
		List<CollectArticle> listOfCollectArticles = collectArticleDAO.selectByMemberId(memberId);
		for (CollectArticle article : listOfCollectArticles) {
			if (article.getMessageId() == messageId) {
				return -1;
			}
		}
		CollectArticle collectArticle = new CollectArticle();
		collectArticle.setMessageId(messageId);
		collectArticle.setMemberId(memberId);
		return collectArticleDAO.insert(collectArticle);
	}
	
//	public int likeArticle(int messageId, String memberId) {
//		
//	}
}
