package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import model.bean.OrderDetail;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SessionFactory sessionFactory;
	private final String inserSqr = "INSERT INTO OrderDetail (orderId,productName,price,quantity)  VALUES (?,?,?,?)";
	private final String deleteSqr = "DELETE FROM OrderDetail WHERE orderDetailId=?";

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 一次新增很多OrderDetail
	// "INSERT INTO OrderDetail (orderId,productName,price,quantity) VALUES
	// (?,?,?,?)"
	public boolean insertOrderDetails(List<OrderDetail> listOrderDetail) throws SQLException {
		DataSource ds=SessionFactoryUtils.getDataSource(sessionFactory);
		Connection conn=ds.getConnection();
		PreparedStatement stat = conn.prepareStatement(inserSqr);

		if (listOrderDetail != null) {
			for (OrderDetail od : listOrderDetail) {
				stat.setInt(1, od.getOrderId());
				stat.setString(2, od.getProductName());
				stat.setInt(3, od.getPrice());
				stat.setInt(4, od.getQuantity());
				stat.addBatch();
			}

			stat.executeQuery();
			conn.commit();
			return true;
		}
		return false;
	}

	// 一次刪除很多OrderDetail
	// "DELETE FROM OrderDetail WHERE orderDetailId=?";
	public int delete(List<Integer> orderDetailIdList) throws SQLException {
		DataSource ds=SessionFactoryUtils.getDataSource(sessionFactory);
		Connection conn=ds.getConnection();
		PreparedStatement stat = conn.prepareStatement(deleteSqr);
		int deleteCount = 0;

		if (orderDetailIdList != null) {
			for (Integer i : orderDetailIdList) {

				stat.setInt(1, i);
				stat.addBatch();
				deleteCount++;
			}
			stat.executeQuery();
			conn.commit();
			return deleteCount;
		}

		return 0;
	}

	// 查詢OrderDetail by OrderId

	public List<OrderDetail> selectByOrderId(Integer OrderdId) {
		if (OrderdId != 0) {
			Query<OrderDetail> query = getSession().createQuery("select * from ORDERDETAIL where ORDERID = ?",
					OrderDetail.class);
			query.setParameter(1, OrderdId);

			return query.list();
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
