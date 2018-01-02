package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import model.bean.Cart;
import model.bean.OrderDetail;
import model.bean.PostArticle;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;
	private final String inserSqr = "INSERT INTO OrderDetail (orderId,productName,price,quantity,productId)  VALUES (?,?,?,?,?)";
	private final String deleteSqr = "DELETE FROM OrderDetail WHERE orderId=:orderId";

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 一次新增很多OrderDetail
	// "INSERT INTO OrderDetail (orderId,productName,price,quantity) VALUES
	// (?,?,?,?)"
	public boolean insertOrderDetails(Map<Integer, Cart> map,int orderId) throws SQLException {
		DataSource ds=SessionFactoryUtils.getDataSource(sessionFactory);
		Connection conn=ds.getConnection();
		PreparedStatement stat = conn.prepareStatement(inserSqr);

		if (map != null) {
			for (Object key : map.keySet()) {
				stat.setInt(1, orderId);
				stat.setString(2, map.get(key).getProductName());
				stat.setInt(3, map.get(key).getPrice());
				stat.setInt(4, map.get(key).getQuantity());
				stat.setInt(5, map.get(key).getProductId());
				stat.addBatch();
			}

			stat.executeBatch();
			conn.commit();
			return true;
		}
		return false;
	}

	// 一次刪除很多OrderDetail
	// "DELETE FROM OrderDetail WHERE orderDetailId=?";
	public int delete(int orderId)  {
		
		Query<?> query = getSession().createQuery(deleteSqr);
		query.setParameter("orderId", orderId);
		int result = query.executeUpdate();
		return result;
	}

	// 查詢OrderDetail by OrderId

	public List<OrderDetail> selectByOrderId(Integer orderId) {
		System.out.println(orderId);
		if (orderId != 0) {
			return getSession().createQuery("from OrderDetail where orderId = :orderId ", OrderDetail.class)
					.setParameter("orderId", orderId).list();
//			query.setParameter("orderId", orderdId);

	
		}
		return null;
	}
	
	//查詢OrderDetail by OrderDetailId(一次一個)
	public OrderDetail selectByOrderDetailId(Integer OrderDetailId) {
		if(OrderDetailId!= null) {
			return getSession().get(OrderDetail.class, OrderDetailId);
			
		}		
		return null;
	}
	

	// 修改OrderDetail by OrderDetailId (一次一個)
	
	public boolean updateOrderDetail(OrderDetail orderDetail) {
		if(orderDetail!=null) {
			OrderDetail select= this.selectByOrderDetailId(orderDetail.getOrderDetailId());
			select.setPrice(orderDetail.getPrice());
			select.setProductName(orderDetail.getProductName());
			select.setQuantity(orderDetail.getQuantity());
			return true;
		}
		
		return false;
	}
	
	

}
