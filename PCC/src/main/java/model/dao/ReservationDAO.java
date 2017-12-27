package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Reservation;

@Repository
public class ReservationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 使用memberId選擇有無預約表 ,有回傳1,無回傳0
	public Integer selectCountByMemberId(String memberId) {
		Number number = (Number) getSession().createQuery("select count(*) from Reservation where memberId = :memberId")
				.setParameter("memberId", memberId).getSingleResult();
		return number.intValue();
	}

	// 選擇預約表Id(reservantionId)(有預約表才可選)
	public Integer selectReservationId(String memberId) {
		Query<Integer> query = getSession().createQuery("select reservationId from Reservation where memberId = ?",
				Integer.class);
		query.setParameter(0, memberId);
		return query.getSingleResult();
	}

	// // 服務員下拉選擇配對清單預約者
	// public List<Object[]> selectReservationName(String servantMemberId) {
	// Query query = getSession().createQuery(
	// "select memberId,name from Reservation where reservationId in (select
	// reservation from Matching where serviceId in(select serviceId from Servant
	// where memberId = :memberId ");
	// query.setParameter("memberId", servantMemberId);
	// return query.getResultList();
	// }

	// 讀取單筆客戶資訊
	public Reservation selectReservationInfo(String memId) {
		Query<Reservation> query = getSession().createQuery("from Reservation where memberId = :memId",
				Reservation.class);
		query.setParameter("memId", memId);
		return query.getSingleResult();
	}

	// 新增會員的預約表資料
	public boolean insertReservationForm(Reservation reservation) {
		this.getSession().save(reservation);
		return true;
	}

}
