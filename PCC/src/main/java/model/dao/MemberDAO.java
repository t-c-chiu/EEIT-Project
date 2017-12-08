package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Member;

@Repository
public class MemberDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	//SELECT name FROM Member WHERE memberId='Tester';
	public String selectName(String memberId){
		Query<String> query = getSession().createQuery("select name FROM Member WHERE memberId = ?", String.class);
		query.setParameter(0, memberId);
		return query.getSingleResult();
	}
	
	//SELECT memberId,password FROM Member WHERE memberId='Tester';
	public Member select(String memberId) {
		
		return getSession().get(Member.class, memberId);
	}


}
