package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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

	// SELECT name FROM Member WHERE memberId='Tester';
	// public Member selectName(String memberId){
	// return (Member) this.getSession().createQuery("SELECT name FROM Member WHERE
	// memberId = " + memberId);
	// }

	// SELECT memberId,password FROM Member WHERE memberId='Tester';
	public Member select(String memberId) {
		return getSession().get(Member.class, memberId);
	}

}
