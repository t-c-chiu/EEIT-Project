package model.dao;

import java.util.Date;
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

	public boolean insert(PostArticle bean) {
		try {
			getSession().save(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<PostArticle> select() {
		return getSession().createQuery("from PostArticle", PostArticle.class).list();
	}

	public PostArticle selectByMessageId(int messageId) {
		return getSession().get(PostArticle.class, messageId);
	}

	public List<PostArticle> selectByCategory(String category) {
		return getSession().createQuery("from PostArticle where category = " + category, PostArticle.class).list();
	}

	public int selectMessageIdByTopic(String topic) {
		return getSession().createQuery("select messageId from PostArticle where topic = " + topic, int.class)
				.getSingleResult();
	}

	public boolean update(PostArticle bean) {
		PostArticle updateBean = selectByMessageId(bean.getMessageId());
		if (updateBean != null) {
			updateBean.setTopic(bean.getTopic());
			updateBean.setCategory(bean.getCategory());
			updateBean.setContents(bean.getContents());
			updateBean.setPhoto(bean.getPhoto());
			updateBean.setDate(new Date());
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
