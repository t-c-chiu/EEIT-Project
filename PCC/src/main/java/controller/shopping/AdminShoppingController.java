package controller.shopping;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value = { "products", "productPage", "adminProduct", "categoryName" })
public class AdminShoppingController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ServletContext application;

	private String searchWay;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}

	// 後台ID搜尋商品
	@RequestMapping(path = { "/adminSearchIdForProduct.shopping" }, method = RequestMethod.GET)
	public String adminSearchIdForProduct(int productId, String searchWay, Model model) {

		if (productId != 0) {
			List<Product> adminProduct;
			this.searchWay = searchWay;
			adminProduct = new ArrayList<Product>();
			Product pp = productService.search(productId);
			adminProduct.add(pp);
			model.addAttribute("adminProduct", adminProduct);

		}

		return "admin.product";
	}

	// 後臺搜尋商品名
	@RequestMapping(path = { "/adminSearchNameForProduct.shopping" }, method = RequestMethod.GET)
	public String adminSearchNameForProduct(String productName, String searchWay, Model model) {
		List<Product> adminProduct;
		if (productName != null) {
			this.searchWay = searchWay;
			adminProduct = productService.searchText(productName);
			model.addAttribute("adminProduct", adminProduct);
		}

		return "admin.product";
	}

	// 後臺搜尋分類欄
	@RequestMapping(path = { "/adminSearchCategoryForProduct.shopping" }, method = RequestMethod.GET)
	public String adminSearchCategoryForProduct(String category, String searchWay, Model model) {
		if (category != null) {
			List<Product> adminProduct;
			this.searchWay = searchWay;
			adminProduct = productService.searchByCategory(category);
			model.addAttribute("adminProduct", adminProduct);
		}
		return "admin.product";
	}

	// 後臺搜尋狀態欄
	@RequestMapping(path = { "/adminSearchStatusForProduct.shopping" }, method = RequestMethod.GET)
	public String adminSearchStatusForProduct(int status, String searchWay, Model model) {
		this.searchWay = searchWay;
		List<Product> adminProduct;
		adminProduct = productService.selectProductStatus(status);
		model.addAttribute("adminProduct", adminProduct);
		return "admin.product";
	}

	// 後台新增商品
	@RequestMapping(path = { "/adminInsert.shopping" }, method = RequestMethod.POST)
	public String insertProduct(Product product, MultipartFile photo, Model model) {
		int saveOkId = productService.insertProducts(product);
		if (photo != null) {
			String path = this.imageHelper(saveOkId, photo);
			productService.updateProduct(product, path);
		}
		return "admin.product";

	}

	// 為了後台更新產品
	@RequestMapping(path = { "/adminUpdata.shopping" }, method = RequestMethod.POST, produces = {
			"text/plain;charset=utf-8" })
	public String updateProduct(Product product, MultipartFile photo, Model model) {
		List<Product> adminProduct = null;
		if (product != null) {
			String path = this.imageHelper(product.getProductId(), photo);
			productService.updateProduct(product, path);
			if (path == null) {
				productService.updateProduct(product, product.getPictureAscii());
			}
			// 為了及時更新商品圖案
			switch (searchWay) {
			case "id":
				adminProduct = new ArrayList<Product>();
				Product pp = productService.search(product.getProductId());
				adminProduct.add(pp);
				break;
			case "name":
				adminProduct = productService.searchText(product.getProductName());
				break;
			case "category":
				adminProduct = productService.searchByCategory(product.getCategory());
				break;
			case "status":
				adminProduct = productService.selectProductStatus(product.getStatus());
				break;

			}
			model.addAttribute("adminProduct", adminProduct);

			return "admin.product";
		}
		return null;
	}

	public String imageHelper(int id, MultipartFile photo) {

		String name = photo.getOriginalFilename();

		String mimeType = application.getMimeType(name);
		//
		if (mimeType == null) {
			return null;
		}
		String expandedName = "";

		if (mimeType.equals("image/jpeg")) {
			System.out.println("5");
			expandedName = ".jpg";
		} else if (mimeType.equals("image/png")) {
			expandedName = ".png";
		} else if (mimeType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (mimeType.equals("image/bmp")) {
			expandedName = ".bmp";
		} else {
			return null;

		}
		name = id + expandedName;
		String path = "/PCC/images/productImages/" + name;

		byte[] photoByte = new byte[(int) photo.getSize()];
		try {
			InputStream is = photo.getInputStream();
			is.read(photoByte);
			OutputStream os = new FileOutputStream(
					new File("C:\\Maven\\git\\PCC\\src\\main\\webapp\\images\\productImages", name));
			os.write(photoByte);
			os.close();
			photo.transferTo(new File(application.getRealPath("/images/productImages"), name));

		} catch (IOException e) {
			e.printStackTrace();
			return "null";// 失敗
		}

		return path;
	}

}
