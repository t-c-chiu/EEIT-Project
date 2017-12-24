package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.Order;

@Repository
public class OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 會員一次新增一筆
	public int insertOlder(Order order) {
		if (order != null) {
			return (Integer) getSession().save(order);
		}
		return -1;
	}

	// 系統或管理元修改，一次改一筆
	public boolean updateOlder(Order order) {
		if (order != null) {
			Order select = this.selectOrderId(order.getOrderId());
			if (select != null) {
				select.setDiscount(order.getDiscount());
				select.setStatus(order.getStatus());
				select.setTotalPrice(order.getTotalPrice());
				select.setLocation(order.getLocation());
				select.setDate(order.getDate());
			}
		}
		return false;
	}

	public boolean cancelOrder(String memberId) {
		getSession().delete(memberId);
		return true;
	}

	// 會員查詢自己所有的訂單
	public List<Order> selectAllOrder(String memberId) {
		Query<Order> query = getSession().createQuery("select * from Order where memberId = ?", Order.class);
		query.setParameter(0, memberId);
		return query.list();
	}

	// 管理員查詢所有訂單
	public List<Order> selectAllOrderByAd() {
		List<Order> listQuery = getSession().createQuery("select * from Order", Order.class).list();
		return listQuery;
	}

	// 管理員按照訂單號碼查詢
	public Order selectOrderId(int orderId) {
		return getSession().get(Order.class, orderId);
	}

	public List<Order> selectAllByMemberIdStatus0(String memberId) {
		return getSession().createQuery("from Order where memberId = :memberId and status = 0", Order.class)
				.setParameter("memberId", memberId).list();
	}

}
