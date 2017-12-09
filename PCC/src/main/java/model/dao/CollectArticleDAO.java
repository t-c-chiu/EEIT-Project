package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.CollectArticle;

@Repository
public class CollectArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public int insert(CollectArticle collectArticle) {
		return (int) getSession().save(collectArticle);
	}

	public List<CollectArticle> selectByMemberId(String memberId) {
		return getSession().createQuery("from CollectArticle where memberId = :memberId", CollectArticle.class)
				.setParameter("memberId", memberId).list();
	}

}
