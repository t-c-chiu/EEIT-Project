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
	
	public List<Room> selectAllRoom(){
		Query<Room> query=getSession().createQuery("from Room",Room.class);
	    return query.list();
	}
	
	//如果沒有填地區回傳所有區域的某房型
	public List<Room> selectByRoomType(String roomType){
		Query<Room> query=getSession().createQuery("from Room Where roomType=?",Room.class);
		query.setParameter(0, roomType);
		return query.list();
	}
	
	
	//依照地區,房型回傳房間
	public List<Room> selectByType(String roomType,String area){
		Query<Room> query=getSession().createQuery("from Room where roomType=? and area=?",Room.class);
		query.setParameter(0, roomType);
		query.setParameter(1, area);
		return query.list();		
	}
	
	//依照指定類別排序(沒用到)
	public List<Room> selectByOrder(String order){
		Query<Room> query=getSession().createQuery("from Room order by "+order,Room.class);
		return query.list();	
	}
	
	//自動帶入關鍵字用(回傳地區)
	public List<String> selectByArea(String area) {
		Query<String> query=getSession().createQuery("select distinct area from Room where area like :area",String.class);
		query.setParameter("area", ""+area+"%");
		return query.list();		
	}
	
	//在地區+房型下依照價格排序
	public List<Room> selectByPrice(int price,String roomType,String area){
		Query<Room> query=getSession().createQuery("from Room where area= :area and roomType= :roomType and price >=:price",Room.class);
		query.setParameter("area",area);
		query.setParameter("roomType",roomType);
		query.setParameter("price",price);
		return query.list();	
	}
	
	public List<Room> selectByPriceAndType(int price,String roomType){
		Query<Room> query=getSession().createQuery("from Room where roomType= :roomType and price >=:price",Room.class);
		query.setParameter("roomType",roomType);
		query.setParameter("price",price);
		return query.list();
	}
	
	
	//新增房間
	public boolean insertRoom(Room room) {
		getSession().save(room);
		return true;
	}
	

	
}
