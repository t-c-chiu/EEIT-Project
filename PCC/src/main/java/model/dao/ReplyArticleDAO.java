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

	public Integer insert(ReplyArticle bean) {
		return (Integer) getSession().save(bean);
	}

	public ReplyArticle selectByReplyId(Integer replyId) {
		return getSession().get(ReplyArticle.class, replyId);
	}

	public List<ReplyArticle> selectByMessageId(Integer messageId) {
		return getSession().createQuery("from ReplyArticle where messageId = :messageId", ReplyArticle.class)
				.setParameter("messageId", messageId).list();
	}

	public List<Integer> selectDistinctMessageIdByMemberId(String memberId) {
		return getSession()
				.createQuery("select distinct messageId from ReplyArticle where memberId = :memberId", Integer.class)
				.setParameter("memberId", memberId).list();
	}

	public Integer selectCountByMessageId(Integer messageId) {
		Number number = (Number) getSession()
				.createQuery("select count(*) from ReplyArticle where messageId = :messageId")
				.setParameter("messageId", messageId).getSingleResult();
		return number.intValue();
	}

	public boolean delete(ReplyArticle bean) {
		getSession().delete(bean);
		return true;
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
