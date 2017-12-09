package model.dao;

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

	public int insert(ReplyArticle bean) {
		return (int) getSession().save(bean);
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
			return true;
		}
		return false;
	}

}
