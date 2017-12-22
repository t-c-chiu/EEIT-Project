package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.sql.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Member;

@Repository
public class MemberCenterDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private MemberDAO memberDAO;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

}
