package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Order;
import model.dao.OrderDAO;

@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderDAO orderDAO;
//	@Autowired
//	private Order order;

	// 新增訂單
	public int insertOrder(Order order) {
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

	// 刪除
	public int deleteOrder(int orderId) {

		int i = orderDAO.deleteOrder(orderId);
		return i;
	}

}
