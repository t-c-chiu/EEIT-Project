package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.PostArticle;
import model.dao.PostArticleDAO;

@Service
@Transactional
public class PostArticleService {

	@Autowired
	PostArticleDAO postArticleDAO;

	public int postArticle(PostArticle bean) {
		bean.setLikes(0);
		bean.setStatus(0);
		return postArticleDAO.insert(bean);
	}

	public List<PostArticle> showAllArticles() {
		return postArticleDAO.select();
	}

	public List<PostArticle> showArticlesByCategory(String category) {
		return postArticleDAO.selectByCategory(category);
	}

	public PostArticle showArticleDetail(int messageId) {
		return postArticleDAO.selectByMessageId(messageId);
	}

	public List<PostArticle> showArticlesByTopic(String topic) {
		topic = "%" + topic + "%";
		return postArticleDAO.selectByTopic(topic);
	}
}
