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

	public List<Integer> selectClassIdByMemberId(String memberId) {
		return getSession().createQuery("select classId from Student where memberId = :memberId", Integer.class)
				.setParameter("memberId", memberId).list();
	}

	public List<String> selectMemberIdByClassId(Integer classId) {
		return getSession().createQuery("select memberId from Student where classId = :classId", String.class)
				.setParameter("classId", classId).list();
	}

	public List<Object[]> selectClazzAndStudentByMemberId(String memberId) {
		return getSession().createQuery(
				"select c, s from Clazz c, Student s where c.classId = s.classId and s.memberId = :memberId",
				Object[].class).setParameter("memberId", memberId).list();
	}

}
