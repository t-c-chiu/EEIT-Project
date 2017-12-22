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

	// //SELECT name FROM Member WHERE memberId='Tester';
	// public String selectName(String memberId){
	// Query<String> query = getSession().createQuery("select name FROM Member WHERE
	// memberId = ?", String.class);
	// query.setParameter(0, memberId);
	// return query.getSingleResult();
	// }

	// SELECT memberId,password FROM Member WHERE memberId='Tester';
	public Member select(String memberId) {

		return getSession().get(Member.class, memberId);
	}

	// INSERT INTO
	// Member(memberId,password,name,email,phone,area,address,role,status,point)VALUES('Tester2',0x70617373776F7264,'測試註冊','123@gmail.com','0909123456','大安區','復興南路一段390號
	// 2,3,15樓',1,0,0);
	public Member insertRegisty(Member member) {
		if (member != null) {
			Member select = this.select(member.getMemberId());
			if (select == null) {
				getSession().save(member);
				return member;
			}
		}
		return null;
	}

	// UPDATE Member
	// SET
	// name = '我是測試',
	// email = '123@gmail.com',
	// phone = '0909123456',
	// area = '大安區',
	// address = '復興南路一段390號 2,3,15樓',
	// WHERE memberId='Tester';
	public Member update(Member member) {
		if (member != null) {
			Member select = this.select(member.getMemberId());
			System.out.println("DAOselect="+select);
			if(select !=null) {
				select.setName(member.getName());
				select.setEmail(member.getEmail());
				select.setPhone(member.getPhone());
				select.setArea(member.getArea());
				select.setAddress(member.getAddress());
				return member;
			}
		}
		return null;
	}

	public boolean updateMemberPoint(Member member, int newPoint) {
		Member result = select(member.getMemberId());
		if (result != null) {
			result.setPoint(newPoint);
			return true;
		}
		return false;
	}

}
