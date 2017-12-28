package model.service;

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


	// 根據ID搜尋
	public Product search(int productId) {
		if (productId != 0) {
			Product product = productDAO.selectId(productId);

			return product;

		}
		return null;
	}

	// 搜尋全部商品for後台
	public List<Product> searchALL() {

		List<Product> listProduct = productDAO.selectAll();

		return listProduct;
	}


	// 搜索模糊商品名
	public List<Product> searchText(String productName) {

		if (productName != null && productName.trim().length() != 0) {

			List<Product> listProduct = productDAO.selectProductName(productName);

			return listProduct;
		}
		return null;
	}

	// 搜索分類
	public List<Product> searchByCategory(String category) {
		if (category != null) {
			List<Product> products = productDAO.selectCategory(category);
			return products;
		}
		return null;
	}

	// 搜索狀態
	public List<Product> selectProductStatus(int stauts) {

		List<Product> products = productDAO.selectProductStatus(stauts);
		return products;

	}

	// 新增產品for後台
	public int insertProducts(Product Product) {
		if (Product != null) {
			int saveOK = productDAO.insert(Product);
			return saveOK;
		}
		return 0;
	}

	// 產品更新for後台(一次一更新一筆)
	public boolean updateProduct(Product product, String path) {
		
		if (product != null) {
			product.setPictureAscii(path);
			productDAO.updateProduct(product);
		}
		return false;
	}

	// 產品剛開始就搜尋資料庫有哪些類別
	public List<CategoryType> categoryFilter() {

		return categoryDAO.selectTypeOfCategory();

	}

	// 產品搜尋用狀態 0是下架 1是普通 2是熱銷 3是新上市
	public List<Product> hotProduct(int status) {

		return productDAO.selectProductStatus(status);

	}

}
