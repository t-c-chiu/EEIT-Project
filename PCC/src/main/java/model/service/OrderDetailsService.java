package model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Cart;
import model.bean.OrderDetail;
import model.dao.OrderDetailDAO;

@Service
@Transactional
public class OrderDetailsService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;

	
	public boolean insertOrderDetails(Map<Integer, Cart> map,int orderId) throws SQLException {
	
		orderDetailDAO.insertOrderDetails(map,orderId);
		
		return true;
	}
	
	
	public List<OrderDetail> selectOrderDetail(Integer orderId){
		return	orderDetailDAO.selectByOrderId(orderId);
	}
	
}
