package model.dao;


import java.io.InputStream;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import javax.sql.rowset.serial.SerialClob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import model.bean.Product;


@Repository
public class ProductDAO {
	


	

	@Autowired
	private SessionFactory sessionFactory;
	private final String  sqlInsert=
			"INSERT INTO Product(productName,stock,price,category,pictureascii,status)VALUES(?,?,?,?,?,?)";

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 根據ID搜尋
	public Product selectId(int productId) {
		Product selectBean = getSession().get(Product.class, productId);

		return selectBean;

	}

	// 搜尋全部上架商品
	public List<Product> selectAll() {

		List<Product> listProduct = getSession().createQuery("select * form PRODUCT", Product.class).list();

		return listProduct;
	}

	// 根據分類搜尋
	public List<Product> selectCategory(String category) {

		Query<Product> query = getSession().createQuery("from Product where category = ?", Product.class);
		query.setParameter(0, category);

		return query.list();

	}

	// 根據商品名模糊搜尋
	public List<Product> selectProductName(String productName) {
		Query<Product> query = getSession().createQuery("from Product where productName like '%"+productName+"%' ", Product.class);
	
		System.out.println("DAO back");
		return query.list();

	}

	// 更新商品，一次一個

	public boolean updateProduct(int productId, int stock, int price, String productName, String category,
			String pictureascii) {
		Product selecteBean = this.selectId(productId);
		if (selecteBean != null) {

			selecteBean.setStock(stock);
			selecteBean.setPrice(price);
			selecteBean.setProductName(productName);
			selecteBean.setCategory(category);
			selecteBean.setCategory(category);
			selecteBean.setPictureAscii(pictureascii);

			return true;
		}

		return false;
	}
	
	//一次新增一個
	public int insert (Product product) {
		if(product!=null) {
			getSession().save(product);
			return 1;
		}		
		return 0;
	}
	
	
	

	// 批次新增商品"INSERT INTO Product(productName,stock,price,category,picture,status,date)VALUES(?,?,?,?,?,?,?)";
	public int insertProducts(List<Product> listProduct) throws SQLException {
		int saveCount=0;

		DataSource ds=SessionFactoryUtils.getDataSource(sessionFactory);
		Connection conn=ds.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sqlInsert);
		conn.setAutoCommit(false);
		if (!listProduct.isEmpty()) {
			for(Product product: listProduct) {
				stmt.setString(1, product.getProductName());
		
				stmt.setInt(2, product.getStock());
			
				stmt.setInt(3, product.getPrice());
		
				stmt.setString(4, product.getCategory());
			
//				InputStream is= new SerialBlob(product.getPictureAscii()).getBinaryStream();
//				stmt.setBinaryStream(5, is);
				stmt.setString(5, product.getPictureAscii());
//				InputStream is = new SerialClob(product.getPictureAscii()).getAsciiStream();
//				stmt.setAsciiStream(5, is);
				
				stmt.setInt(6,product.getStatus());
				
//				stmt.setDate(7, null);
//				System.out.println("7");
				stmt.addBatch();
				saveCount++;
			}
			
			stmt.executeBatch();
			conn.commit();
			System.out.println("dao ok: " + saveCount);
			return saveCount;

		}
		System.out.println("DAO is 0");
		return 0;
	}

}
