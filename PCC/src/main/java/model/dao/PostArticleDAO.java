package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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

	public int insert(PostArticle bean) {
		try {
			int messageId = (int) getSession().save(bean);
			return messageId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<PostArticle> select() {
		return getSession().createQuery("from PostArticle", PostArticle.class).list();
	}

	public PostArticle selectByMessageId(int messageId) {
		return getSession().get(PostArticle.class, messageId);
	}

	public List<PostArticle> selectByCategory(String category) {
		Query<PostArticle> query = getSession().createQuery("from PostArticle where category = ?", PostArticle.class);
		return query.setParameter(0, category).list();
	}

	public int selectMessageIdByTopic(String topic) {
		Query<Integer> query = getSession().createQuery("select messageId from PostArticle where topic = ?", int.class);
		return query.setParameter(0, topic).getSingleResult();
	}

	public boolean update(PostArticle bean) {
		PostArticle updateBean = selectByMessageId(bean.getMessageId());
		if (updateBean != null) {
			updateBean.setTopic(bean.getTopic());
			updateBean.setCategory(bean.getCategory());
			updateBean.setContents(bean.getContents());
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
