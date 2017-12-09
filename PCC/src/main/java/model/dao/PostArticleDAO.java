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
		return getSession().createQuery("from PostArticle order by " + order + " desc", PostArticle.class).list();
	}

	public PostArticle selectByMessageId(Integer messageId) {
		return getSession().get(PostArticle.class, messageId);
	}

	public List<PostArticle> selectByCategory(String category) {
		return getSession()
				.createQuery("from PostArticle where category = :category order by messageId desc", PostArticle.class)
				.setParameter("category", category).list();
	}

	public List<PostArticle> selectByTopic(String topic) {
		return getSession()
				.createQuery("from PostArticle where topic like :topic order by messageId desc", PostArticle.class)
				.setParameter("topic", topic).list();
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
		if (selectByMessageId(bean.getMessageId()) != null) {
			getSession().delete(bean);
			return true;
		}
		return false;
	}

}
