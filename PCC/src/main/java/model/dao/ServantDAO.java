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

	public Object selectServantInfo(String memId) {
		Query query = getSession().createQuery("from Servant where memberId = :memId");
		query.setParameter("memId", memId);
		return query.getSingleResult();
	}

	public Servant selectByServiceId(int serviceId) {
		return getSession().get(Servant.class, serviceId);
	}

}
