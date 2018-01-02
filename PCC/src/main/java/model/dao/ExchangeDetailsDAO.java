package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.ExchangeDetails;
import model.bean.RoomReservation;

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
	
	public boolean deleteDetailbyId(int exchangeDetailsId) {		
		ExchangeDetails result = (ExchangeDetails) getSession().get(ExchangeDetails.class, exchangeDetailsId);
		getSession().delete(result);
		return true;				
	}
		
}
