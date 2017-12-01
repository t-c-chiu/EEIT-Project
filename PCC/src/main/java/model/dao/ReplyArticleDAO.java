package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.ReplyArticle;

@Repository
public class ReplyArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean insert(ReplyArticle bean) {
		try {
			getSession().save(bean);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public ReplyArticle selectByReplyId(int replyId) {
		return getSession().get(ReplyArticle.class, replyId);
	}

	public List<ReplyArticle> selectByMessageId(int messageId) {
		return getSession().createQuery("from ReplyArticle where messageId = " + messageId, ReplyArticle.class).list();
	}

	public boolean delete(ReplyArticle bean) {
		if (selectByReplyId(bean.getReplyId()) != null) {
			getSession().delete(bean);
			return true;
		}
		return false;
	}

	public boolean update(ReplyArticle bean) {
		ReplyArticle updateBean = selectByReplyId(bean.getReplyId());
		if (updateBean != null) {
			updateBean.setContents(bean.getContents());
			updateBean.setPhoto(bean.getPhoto());
			updateBean.setDate(new Date());
			return true;
		}
		return false;
	}

}
