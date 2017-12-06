package model.service;

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
		return postArticleDAO.insert(bean);
	}
}
