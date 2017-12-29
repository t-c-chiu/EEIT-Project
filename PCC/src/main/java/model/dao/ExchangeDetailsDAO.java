package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
	
	public List<ExchangeDetails> selectDetail(String memberId){
		Query<ExchangeDetails> query=getSession().createQuery("from ExchangeDetails where memberId=? and status=0",ExchangeDetails.class);
		query.setParameter(0, memberId);
		return query.list();
	}
	
}
