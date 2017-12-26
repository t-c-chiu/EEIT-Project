package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Matching;
import model.bean.Reservation;
import model.bean.Servant;

@Repository
public class MatchingDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	// 抓取全部的服務員
	public List<Servant> selectServantList() {
		Query<Servant> query = getSession().createQuery("from Servant", Servant.class);
		return query.getResultList();
	}

	// 使用memberId尋找預約表bean回傳 沒有則回跳exception
//	public Reservation selectReservation(String memberId) {
		// return this.getSession().get(Reservation.class, memberId); //要使用主鍵
//		Query<Reservation> query = getSession().createQuery("from Reservation where memberId = ?", Reservation.class);
//		query.setParameter(0, memberId);
//		return query.getSingleResult();
//	}
	
	// 使用memberId選擇有無預約表 ,有回傳1,無回傳0
	public Integer selectCountByMemberId(String memberId) {
		Number number = (Number) getSession().createQuery("select count(*) from Reservation where memberId = :memberId")
				.setParameter("memberId", memberId).getSingleResult();
		return number.intValue();
	}

	// 新增會員的預約表資料
	public boolean insertReservationForm(Reservation reservation) {
		this.getSession().save(reservation);
		return true;
	}

	// 新增配對表
	public boolean insertMatchingForm(Matching matching) {
		this.getSession().save(matching);
		return true;
	}
	
	// 選擇預約表Id(reservantionId)(有預約表才可選)
	public Integer selectReservationId(String memberId) {
		Query<Integer> query = getSession().createQuery("select reservationId from Reservation where memberId = ?", Integer.class);
		query.setParameter(0, memberId);
		return query.getSingleResult();
	}
	
	// 選擇有無配對表,有回傳1,無回傳0
	public Integer selectCountByMappingId(String idMapping) {
		Number number = (Number) getSession().createQuery("select count(*) from Matching where mappingId = :mappingId")
				.setParameter("mappingId", idMapping).getSingleResult();
		return number.intValue();
	}
	
	// 預約者下拉選擇配對清單服務員
	public List<Object[]> selectServantName(int reservationId) {
		Query query = getSession().createQuery("select memberId,name from Member where memberId in (select memberId from Servant where serviceId in (select serviceId from Matching where reservationId = :reservationId))");
	    query.setParameter("reservationId", reservationId);
		return query.getResultList();
	}
	
	// 服務員下拉選擇配對清單預約者
	public List<Object[]> selectReservationName(String servantMemberId){
		Query query = getSession().createQuery("select memberId,name from Reservation where reservationId in (select reservation from Matching where serviceId in(select serviceId from Servant where memberId = :memberId ");
	    query.setParameter("memberId", servantMemberId);
	    return query.getResultList();
	}
	
	// 讀取單筆服務員資訊
	public Object selectServantInfo(String memId) {
		Query query = getSession().createQuery("from Servant where memberId = :memId");
		query.setParameter("memId", memId);
		return query.getSingleResult();
	}
		
	// 讀取單筆客戶資訊
	public Object selectReservationInfo(String memId) {
		Query query = getSession().createQuery("from Reservation where memberId = :memId");
		query.setParameter("memId", memId);
		return query.getSingleResult();
	}
	
	
	
}
