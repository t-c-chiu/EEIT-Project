package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.ReportedArticle;

@Repository
public class ReportedArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Integer insert(ReportedArticle reportedArticle) {
		return (Integer) getSession().save(reportedArticle);
	}

	public List<ReportedArticle> selectMessageIdByStatus(Integer status) {
		return getSession().createQuery("from ReportedArticle where status = :status", ReportedArticle.class)
				.setParameter("status", status).list();
	}

	public List<ReportedArticle> selectAll() {
		return getSession().createQuery("from ReportedArticle order by status", ReportedArticle.class).list();
	}

	public List<ReportedArticle> selectByMessageId(Integer messageId) {
		return getSession().createQuery("from ReportedArticle where messageId = :messageId", ReportedArticle.class)
				.setParameter("messageId", messageId).list();
	}

	public ReportedArticle selectByReportId(Integer reportId) {
		return getSession().get(ReportedArticle.class, reportId);
	}

	public Integer selectCountByMessageId(Integer messageId) {
		Number number = (Number) getSession()
				.createQuery("select count(*) from ReportedArticle where messageId = :messageId")
				.setParameter("messageId", messageId).getSingleResult();
		return number.intValue();
	}

	public boolean delete(ReportedArticle reportedArticle) {
		getSession().delete(reportedArticle);
		return true;
	}

}
