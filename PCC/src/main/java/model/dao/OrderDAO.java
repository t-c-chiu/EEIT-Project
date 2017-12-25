package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.bean.Order;

@Repository
public class OrderDAO {

	private SessionFactory sessionFactory;
	
	public Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	
	
	//會員一次新增一筆
	public int insertOlder(Order order) {
		if(order!=null) {
			int orderId=(int)getSession().save(order);

			return orderId;
		}		
		return 0;
	}
	
	
	//系統或管理元修改，一次改一筆
	public boolean updateOlder(Order order) {
		if(order!=null) {
			Order select=this.selectOrderId(order.getOrderId());
			if(select!=null) {
//				select.setMemberId(order.getMemberId());
				select.setDiscount(order.getDiscount());
				select.setStatus(order.getStatus());
				select.setTotalPrice(order.getTotalPrice());
				select.setLocation(order.getLocation());
				select.setDate(order.getDate());
				select.setRecipient(order.getRecipient());
				select.setRecipientPhone(order.getRecipientPhone());
				
			}		
		}		
		return false;
	}
	
	public boolean cancelOrder(String memberId) {
		
		if(memberId!=null) {
			
			getSession().delete(memberId);
			
			return true;
		}
		
		return false;
	}
	
	//會員查詢自己所有的訂單
	
	public List<Order> selectAllOrder(String memberId){
		if(memberId!=null) {
		Query<Order> query= getSession().createQuery("select * from ORDER where memberId = ?", Order.class);
		query.setParameter(0, memberId);

		return query.list();
		}
		return null;
	}
	
	//管理員查詢所有訂單
	public List<Order> selectAllOrderByAd(){
		List<Order> listQuery=getSession().createQuery("select * from Order",Order.class).list();
		return listQuery;
	}
	


	//管理員按照訂單號碼查詢
	
	public Order selectOrderId(int orderId) {
		if(orderId!=0) {
			Order order=getSession().get(Order.class,orderId);
			
			return order;
		}		
		return null;
	}
	

}
