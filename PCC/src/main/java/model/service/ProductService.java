package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Product;
import model.dao.ProductDAO;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO; 

	//根據ID搜尋
	public Product search(int productId){
		if(productId!=0) {
		Product product=productDAO.selectId(productId);
		System.out.println("Service ok :");
		return product;
		}
		return null;
	}
	
	//搜尋全部商品for後台
	public List<Product> searchALL(){
		
		List<Product> listProduct=productDAO.selectAll();

		return listProduct;
	}
	
	public List<Product> searchText(String productName){
		System.out.println("service start");
		if(productName!=null && productName.trim().length()!=0) {
			
			List<Product> listProduct=productDAO.selectProductName(productName);
			System.out.println("service start"+productName);	
			return listProduct;
		}		
		return null;
	}
	
	//新增產品for後台(希望能做到批次新增)
	public int insertProducts(Product Product) throws SQLException{
		if(Product!=null  ) {
//		int saveOK =productDAO.insert(Product);
		List<Product> listProduct= new ArrayList<Product>();	
		listProduct.add(Product);
		int saveOK=productDAO.insertProducts(listProduct);
		System.out.println("Service ok :"+saveOK);
		return saveOK;
		}
		return 0;
		
	}
	
	//產品更新for後台(一次一更新一筆)
	public boolean updateProduct(Product Product) {
		if(Product!=null) {
		productDAO.updateProduct(Product.getProductId(), Product.getStock(), Product.getPrice(), Product.getProductName(), Product.getCategory(), Product.getPictureAscii());
		}
		return false;
	}
	
}
