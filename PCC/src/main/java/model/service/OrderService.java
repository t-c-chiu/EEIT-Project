package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Order;
import model.dao.OrderDAO;
import model.dao.OrderDetailDAO;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderDetailDAO orderDetailDAO;

	// 新增訂單
	public int insertOrder(Order order) {
		if(order.getLocation()==null) {
			order.setLocation("未結帳，未填寫。");
		}
		if(order.getRecipient()==null) {
			order.setRecipient("未結帳，未填寫。");
		}
		if(order.getRecipientPhone()==null) {
			order.setRecipientPhone("未結帳，未填寫。");
		}

		int i = orderDAO.insertOlder(order);
		return i;
	}

	// 修改

	public boolean updataOrder(Order order) {
		if (order != null) {
			boolean b = orderDAO.updateOlder(order);
			return b;

		}

		return false;
	}

	// 刪除 ：必須先刪除訂單明細，再刪除訂單
	public int deleteOrder(Order order) {
		int i = orderDetailDAO.delete(order.getOrderId());
//		if (i > 0) {
			int x = orderDAO.deleteOrder(order);
			return x;
//		}
//		return 0;
	}

	// 查詢所有訂單
	public List<Order> selectAllOrder() {
		// 查詢所有訂單
		return orderDAO.selectAllOrderByAd();

	}

	// 查詢訂單ById
	public List<Order> selectOrderById(int orderId) {
		List<Order> orders = new ArrayList<Order>();
		orders.add(orderDAO.selectOrderId(orderId));
		return orders;

	}

	// 查詢訂單By狀態
	public List<Order> selectOrderByStatus(int status) {

		return orderDAO.selectAllByStatus(status);

	}

	// 查詢訂單by會員
	public List<Order> selectOrderByMember(String memberId) {

		return orderDAO.selectAllOrder(memberId);

	}
}
