package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.ExchangeDetails;

@Repository
public class ExchangeDetailsDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public boolean insertExchangeDetails(ExchangeDetails exchangeDetails) {
		getSession().save(exchangeDetails);
		return true;
	}
	
}
