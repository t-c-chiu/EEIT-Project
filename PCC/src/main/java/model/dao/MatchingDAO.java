package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Reservation;

@Repository
public class MatchingDAO {
    @Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//抓取全部的服務員
	public List<Object[]> selectServantList() {
		Query query = getSession().createQuery("select s, m.name from Servant s, Member m where s.memberId = m.memberId");
		/*"select new list(s, m.name) from Servant as s, Member as m where s.memberId = m.memberId"*/
		return query.getResultList();

	}
	
	//選擇預約表ID回傳 沒有則回傳null
	public Reservation selectReservation(String memberId) {
		Query<Reservation> query = getSession().createQuery("from Reservation where memberId = ?", Reservation.class);
		query.setParameter(0, memberId);
		return query.getSingleResult();
	}
	
	//新增會員的預約表資料
	public boolean insertReservationForm(Reservation reservation) {
		this.getSession().save(reservation);
		return true;
	}
	
	
}
