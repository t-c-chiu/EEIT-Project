package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.SystemMessage;

@Repository
public class SystemMessageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Integer insert(String memberId, String title, String contents) {
		SystemMessage systemMessage = new SystemMessage();
		systemMessage.setMemberId(memberId);
		systemMessage.setTitle(title);
		systemMessage.setContents(contents);
		systemMessage.setStatus(0);
		return (Integer) getSession().save(systemMessage);
	}

	public List<SystemMessage> selectAllByMemberId(String memberId) {
		return getSession()
				.createQuery("from SystemMessage where memberId = :memberId order by date desc", SystemMessage.class)
				.setParameter("memberId", memberId).list();
	}

	public SystemMessage selectBySystemMessageId(Integer systemMessageId) {
		return getSession().get(SystemMessage.class, systemMessageId);
	}

	public boolean updateStatus(Integer systemMessageId, Integer status) {
		SystemMessage systemMessage = selectBySystemMessageId(systemMessageId);
		if (systemMessage != null) {
			systemMessage.setStatus(status);
			return true;
		} else {
			return false;
		}
	}

}
