package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServantDAO {
    @Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

	//抓取全部的服務員
	public List<Object[]> selectServantList() {
		Query query = getSession().createQuery("select s, m.name from Servant s, Member m where s.memberId = m.memberId");
		/*"select new list(s, m.name) from Servant as s, Member as m where s.memberId = m.memberId"*/
		return query.getResultList();

	}
	
	
}
