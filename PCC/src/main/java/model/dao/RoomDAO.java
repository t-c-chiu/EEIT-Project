package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Room;

@Repository
public class RoomDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<Room> selectByType(String roomType,String area){
		Query<Room> query=getSession().createQuery("from Room where roomType=? and area=?",Room.class);
		query.setParameter(0, roomType);
		query.setParameter(1, area);
		return query.list();		
	}
	
	public List<Room> selectByOrder(String order){
		Query<Room> query=getSession().createQuery("from Room order by "+order,Room.class);
		return query.list();	
	}
	
	public String selectArea(String area) {
		getSession().createQuery("select area from Romm where area like"+area+"%",Room.class);
	    return null;
	}
	

}
