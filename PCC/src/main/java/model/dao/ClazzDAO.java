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

	public List<Clazz> selectAllClazzOrderBy(String order) {
		return getSession().createQuery("from Clazz order by " + order + " desc", Clazz.class).list();
	}

	public List<Clazz> selectAllClazz() {
		return getSession().createQuery("from Clazz order by startDate desc", Clazz.class).list();
	}

	public List<Clazz> selectByCategory(String category) {
		return getSession().createQuery("from Clazz where category = :category", Clazz.class)
				.setParameter("category", category).list();
	}

	public Clazz selectByClassId(Integer classId) {
		return getSession().get(Clazz.class, classId);
	}

	public List<String> selectAllCategory() {
		return getSession().createQuery("select distinct category from Clazz", String.class).list();
	}

}
