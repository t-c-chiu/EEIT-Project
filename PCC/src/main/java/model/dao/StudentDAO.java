package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Student;

@Repository
public class StudentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Integer insert(Student student) {
		return (Integer) getSession().save(student);
	}

	public Integer selectCountByClassId(Integer classId) {
		Number number = (Number) getSession().createQuery("select count(*) from Student where classId = :classId")
				.setParameter("classId", classId).getSingleResult();
		return number.intValue();
	}

	public List<Integer> selectClassIdByMemberId(String memeberId) {
		return getSession().createQuery("select classId from Student where memeberId = :memeberId", Integer.class)
				.list();
	}
}
