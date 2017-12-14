package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Clazz;

@Repository
public class ClazzDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Integer insert(Clazz clazz) {
		return (Integer) getSession().save(clazz);
	}

	public List<Clazz> selectAllClazz() {
		return getSession().createQuery("from Clazz", Clazz.class).list();
	}
	
	public Clazz selectByClassId(Integer classId) {
		return getSession().get(Clazz.class, classId);
	}

}
