package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CustomerBean;
import model.CustomerDAO;

@Repository
public class CustomerDAOHibernate implements CustomerDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public CustomerBean select(String custid) {
		return getSession().get(CustomerBean.class, custid);
	}

	@Override
	public boolean update(byte[] password, String email, java.util.Date birth, String custid) {
		CustomerBean bean = this.select(custid);
		if (bean != null) {
			bean.setPassword(password);
			bean.setEmail(email);
			bean.setBirth(birth);
			return true;
		}
		return false;
	}
}
