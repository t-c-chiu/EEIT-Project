package controller.shopping;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.Product;
import model.service.OrderDetailsService;
import model.service.OrderService;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value = { "products", "productPage", "adminProduct", "categoryName", "searchWay" })
public class AdminShoppingController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ServletContext application;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailsService orderDetailsService;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}

	// 後臺商品搜尋系列
	@RequestMapping(path = { "/adminSearchProduct.shopping" }, method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<Product> adminSearchProduct(int productId, String productName, String category,
			int status, String searchType, Model model) {
		model.addAttribute("searchWay", " ");
		switch (searchType) {
		case "編號查詢":
			List<Product> adminProduct;
			if (productId != 0) {
				adminProduct = new ArrayList<Product>();
				Product pp = productService.search(productId);
				adminProduct.add(pp);
				return adminProduct;
			}
			break;
		case "名稱查詢":
			if (productName != null) {
				adminProduct = productService.searchText(productName);
				return adminProduct;
			}

			break;
		case "分類查詢":
			if (category != null) {
				adminProduct = productService.searchByCategory(category);
				return adminProduct;
			}

			break;
		case "狀態查詢":

			adminProduct = productService.selectProductStatus(status);
			return adminProduct;

		}
		return null;

	}

	// 後台新增商品
	@RequestMapping(path = { "/adminInsert.shopping" }, method = RequestMethod.POST, produces = {
			"text/plain;charset=utf-8" })
	public @ResponseBody String insertProduct(Product product, MultipartFile photo) {
		int saveOkId = productService.insertProducts(product);
		if (photo != null) {
			String path = this.imageHelper(saveOkId, photo);
			productService.updateProduct(product, path);
			return "上架成功!";
		}

		return "上架失敗!";

	}

	// 為了後台更新產品
	@RequestMapping(path = { "/adminUpdata.shopping" }, method = RequestMethod.POST, produces = {
			"text/plain;charset=utf-8" })
	public @ResponseBody String updateProduct(Product product, MultipartFile photo) {
		System.out.println("product:" + product + ", photo:" + photo);
		if (product != null) {
			if (photo != null) {
				String path = this.imageHelper(product.getProductId(), photo);
				productService.updateProduct(product, path);

				if (path == null) {
					productService.updateProduct(product, product.getPictureAscii());

				}
				return "更新成功!";
			}

		}
		return "更新失敗!";
	}

	// 為了後台查訂單
	@RequestMapping(path = { "/adminOrder.shopping" }, method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<Order> orderSearch(int orderId, int status, String memberId, String searchType,
			Model model) {

		switch (searchType) {
		case "訂單編號查詢":
			return orderService.selectOrderById(orderId);

		case "訂單狀態查詢":
			return orderService.selectOrderByStatus(status);
		case "查詢所有訂單":
			return orderService.selectAllOrder();
		case "購買人查詢訂單":
			return orderService.selectOrderByMember(memberId);
		}
		return null;
	}

	// 為了後台查詢訂單明細
	@RequestMapping(path = { "/adminOrderDetail.shopping" }, method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<OrderDetail> adminOrderDetail(Integer orderId) {
		System.out.println("123467897");
		return orderDetailsService.selectOrderDetail(orderId);
	}

	// 為了後台訂單的修改與刪除
	@RequestMapping(path = { "/adminOrderDU.shopping" }, method = RequestMethod.GET, produces = {
			"text/plain;charset=utf-8" })
	public @ResponseBody String adminOrderDU(Order order, String actionType) {
		System.out.println("order" + order + ",actionType" + actionType);
		switch (actionType) {
		case "修改":
			boolean b = orderService.updataOrder(order);
			if (b) {
				return "修改成功!";
			} else {
				return "修改失敗!";
			}

		case "刪除":
			orderService.deleteOrder(order);
			// if(i>0) {
			return "刪除成功!";
		// }
		// return "刪除失敗!";

		}
		return "動作失敗!";
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
		try {
			photo.transferTo(new File(application.getRealPath("/images/productImages"), name));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return path;
	}

}
