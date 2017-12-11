package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.sql.ordering.antlr.GeneratedOrderByFragmentRendererTokenTypes;
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

}
