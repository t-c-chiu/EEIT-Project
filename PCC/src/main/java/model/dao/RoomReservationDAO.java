package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.RoomReservation;

@Repository
public class RoomReservationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public RoomReservation insert(RoomReservation roomReservation) {
		if (roomReservation != null) {
			this.getSession().save(roomReservation);
			return roomReservation;
		}
		return null;

	}

	public List<RoomReservation> selectByMemberId(String memberId) {
		Query<RoomReservation> query = getSession().createQuery("from RoomReservation where memberId=?",
				RoomReservation.class);
		query.setParameter(0, memberId);
		return query.list();
	}

	public List<RoomReservation> selectAllByMemberIdStatus0(String memberId) {
		return getSession()
				.createQuery("from RoomReservation where memberId = :memberId and status = 0", RoomReservation.class)
				.setParameter("memberId", memberId).list();
	}

	public List<RoomReservation> selectAllReservation() {
		Query<RoomReservation> query = getSession().createQuery("from RoomReservation", RoomReservation.class);
		return query.list();
	}

	public boolean delete(int roomReserverId) {
		// Query query=getSession().createQuery("delete RoomReservation from where
		// roomReserverId=?");
		// query.setParameter(0, roomReserverId);
		// query.executeUpdate();
		// return true;

		RoomReservation result = (RoomReservation) getSession().get(RoomReservation.class, roomReserverId);
		getSession().delete(result);
		return true;
	}

	public List<RoomReservation> selectByRoomId(int roomId) {
		Query<RoomReservation> query = getSession().createQuery("from RoomReservation where roomId=?",
				RoomReservation.class);
		query.setParameter(0, roomId);
		return query.list();
	}

}
