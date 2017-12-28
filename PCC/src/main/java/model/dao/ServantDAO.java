package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Servant;

@Repository
public class ServantDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<Servant> selectServantList() {
		Query<Servant> query = getSession().createQuery("from Servant", Servant.class);
		return query.getResultList();
	}

	public Servant selectServantInfo(String memId) {
		return getSession().createQuery("from Servant where memberId = :memId", Servant.class)
				.setParameter("memId", memId).getSingleResult();
	}

	public Servant selectByServiceId(int serviceId) {
		return getSession().get(Servant.class, serviceId);
	}

	public boolean delete(Servant servant) {
		getSession().delete(servant);
		return true;
	}

	public Integer insert(Servant servant) {
		return (Integer) getSession().save(servant);
	}

}
