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
	
	public List<String> selectByArea(String area) {
		Query<String> query=getSession().createQuery("select distinct area from Room where area like :area",String.class);
		query.setParameter("area", ""+area+"%");
		return query.list();		
	}
	
	public List<Room> selectByPrice(int price){
		Query<Room> query=getSession().createQuery("from Room where price >=:price",Room.class);
		query.setParameter("price",price);
		return query.list();	
	}
	

	
}
