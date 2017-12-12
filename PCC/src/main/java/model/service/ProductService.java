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
		System.out.println("Service ok :"+product);
		return product;
		}
		return null;
	}
	
	//搜尋全部商品for後台
	public List<Product> searchALL(){
		
		List<Product> listProduct=productDAO.selectAll();

		return listProduct;
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
	
	
}
