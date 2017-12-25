package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.CategoryType;
import model.bean.Product;
import model.dao.CategoryDAO;
import model.dao.ProductDAO;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;

	//根據ID搜尋
	public Product search(int productId){
		if(productId!=0) {
		Product product=productDAO.selectId(productId);
//		System.out.println("Service ok :");
		return product;
		}
		return null;
	}
	
	//搜尋全部商品for後台
	public List<Product> searchALL(){
		
		List<Product> listProduct=productDAO.selectAll();

		return listProduct;
	}
	//搜索模糊商品名
	public List<Product> searchText(String productName){
//		System.out.println("service start");
		if(productName!=null && productName.trim().length()!=0) {
			
			List<Product> listProduct=productDAO.selectProductName(productName);
//			System.out.println("service start"+productName);	
			return listProduct;
		}		
		return null;
	}
	
	//搜索分類
	public List<Product> searchByCategory(String category){
		if(category!=null) {
			List<Product> products= productDAO.selectCategory(category);
			return products;
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
//		System.out.println("Service ok :"+saveOK);
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
	
	//產品剛開始就搜尋資料庫有哪些類別
	public List<CategoryType> categoryFilter(){
		
		return categoryDAO.selectTypeOfCategory();
		
	}
	
	//產品搜尋用狀態 0是下架 1是普通 2是熱銷 3是新上市	
	public List<Product> hotProduct(int status){
		
		return productDAO.selectProductStatus(status);
		
	} 
	
	
}
