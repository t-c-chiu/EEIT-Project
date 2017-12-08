package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
		Query<CollectArticle> query = getSession().createQuery("from CollectArticle where memberId = ?",
				CollectArticle.class);
		query.setParameter(0, memberId);
		return query.list();
	}

	public Integer selectCountByMessageId(int messageId) {
		Query<Integer> query = getSession().createQuery("select count(*) from CollectArticle where messageId = ?",
				Integer.class);
		query.setParameter(0, messageId);
		return query.getSingleResult();
	}

}
