package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Matching;

@Repository
public class MatchingDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 新增配對表
	public Integer insert(Matching matching) {
		return (Integer) getSession().save(matching);
	}

	public Matching selectByMatchingId(Integer matchingId) {
		return getSession().get(Matching.class, matchingId);
	}

	// 選擇有無配對表,有回傳1,無回傳0
	public Integer selectCountByMappingId(String idMapping) {
		Number number = (Number) getSession().createQuery("select count(*) from Matching where mappingId = :mappingId")
				.setParameter("mappingId", idMapping).getSingleResult();
		return number.intValue();
	}

	public List<Matching> selectByReservationId(Integer reservationId) {
		return getSession().createQuery("from Matching where reservationId = :reservationId", Matching.class)
				.setParameter("reservationId", reservationId).list();
	}

	public List<Object[]> selectMatchingAndServantByReservationId(Integer reservationId) {
		try {
			return getSession().createQuery(
					"from Matching m, Servant s where m.serviceId = s.serviceId and m.reservationId = :reservationId order by m.date desc",
					Object[].class).setParameter("reservationId", reservationId).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Object[]> selectMatchingDetailsByStatus0() {
		return getSession().createQuery(
				"from Reservation r, Servant s, Matching m where m.status = 0 and m.serviceId= s.serviceId and m.reservationId = r.reservationId",
				Object[].class).list();
	}

	public List<Matching> selectByReservationIdAndNotMatchingId(Integer reservationId, Integer matchingId) {
		return getSession()
				.createQuery("from Matching where reservationId = :reservationId and matchingId != :matchingId",
						Matching.class)
				.setParameter("reservationId", reservationId).setParameter("matchingId", matchingId).list();
	}

	// 預約者下拉選擇配對清單服務員
	// public List<Object[]> selectServantName(int reservationId) {
	// Query query = getSession().createQuery(
	// "select memberId,name from Member where memberId in (select memberId from
	// Servant where serviceId in (select serviceId from Matching where
	// reservationId = :reservationId))");
	// query.setParameter("reservationId", reservationId);
	// return query.getResultList();
	// }

}
