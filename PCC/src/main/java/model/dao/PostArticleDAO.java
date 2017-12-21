package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.PostArticle;

@Repository
public class PostArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Integer insert(PostArticle bean) {
		return (Integer) getSession().save(bean);
	}

	public List<PostArticle> selectOrderBy(String order) {
		return getSession()
				.createQuery("from PostArticle where status != 2 order by " + order + " desc", PostArticle.class)
				.list();
	}

	public PostArticle selectByMessageId(Integer messageId) {
		return getSession().get(PostArticle.class, messageId);
	}

	public Integer selectCountOfStatus2(String memberId) {
		Number number = (Number) getSession()
				.createQuery("select count(*) from PostArticle where memberId = :memberId and status = 2")
				.setParameter("memberId", memberId).getSingleResult();
		return number.intValue();
	}

	public List<PostArticle> selectByCategory(String category) {
		return getSession()
				.createQuery("from PostArticle where category = :category and status != 2 order by messageId desc",
						PostArticle.class)
				.setParameter("category", category).list();
	}

	public List<PostArticle> selectByTopic(String topic) {
		return getSession()
				.createQuery("from PostArticle where topic like :topic and status != 2 order by messageId desc",
						PostArticle.class)
				.setParameter("topic", topic).list();
	}

	public List<PostArticle> selectByStatus(Integer status) {
		return getSession().createQuery("from PostArticle where status = :status", PostArticle.class)
				.setParameter("status", status).list();
	}

	public boolean update(PostArticle bean) {
		PostArticle updateBean = selectByMessageId(bean.getMessageId());
		if (updateBean != null) {
			updateBean.setTopic(bean.getTopic());
			updateBean.setCategory(bean.getCategory());
			updateBean.setContents(bean.getContents());
			return true;
		}
		return false;
	}

	public boolean delete(PostArticle bean) {
		getSession().delete(bean);
		return true;
	}

	public String updateContents(PostArticle article) {
		PostArticle updateBean = selectByMessageId(article.getMessageId());
		if (updateBean != null) {
			updateBean.setContents(article.getContents());
			return article.getContents();
		}
		return null;
	}
}
