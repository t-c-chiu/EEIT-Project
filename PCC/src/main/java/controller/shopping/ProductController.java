package controller.shopping;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Cart;
import model.bean.Product;
import model.service.ProductService;
import spring.PrimitiveNumberEditor;

@Controller
@SessionAttributes(value = { "products", "addToCart" })
public class ProductController {

	@Autowired
	private ProductService productService;
	private Map<Integer, Cart> addToCart;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}
	//測試用搜尋
	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.GET)
	public String searchId(int productId, Model model) {

		if (productId != 0) {
			Product product = productService.search(productId);
			model.addAttribute("products", product);

		}
		return "page.productsearchtest";
	}

	//測試用新增
	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.POST)
	public String insertProduct(Product product, BindingResult bindingResult, Model model) throws SQLException {
		System.out.println("Controller start " + product.getPictureAscii());
		int saveOk = productService.insertProducts(product);
		// int saveOk=productService.insertProducts(product);
		model.addAttribute("saveOk", saveOk);

		System.out.println("Controller ok ");
		// return "page.productBackstage";
		return "page.productsearchtest";
	}
	
	
	
	//前往購物車頁面
	@RequestMapping(path = { "/goToCart.shopping" }, method = RequestMethod.GET)
	public String useCartPage(HttpSession session) {
		
		session.getAttribute("addToCart");
		
		
		
		
		return null;	
	}
	
	
	
	
	
	
	
	
	// 購物車功能
	@RequestMapping(path = { "/addCart.shopping" }, method = RequestMethod.POST, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody Cart addCart(int productId, Model model, HttpServletRequest request) {
		System.out.println("controller start in" + productId);

		Product product = productService.search(productId);
		System.out.println("list before");
		Map<Integer, Cart> addToCart = (Map<Integer, Cart>) request.getSession().getAttribute("addToCart");

		// 判斷是否存在
		if (addToCart == null) {
			// 創建購物車
			System.out.println("in 判斷是否有購物車");
			addToCart = new HashMap<Integer, Cart>();
		}

		// 判斷是否存在商品編號的鍵
		Cart cart1 = null;
		if (addToCart.containsKey(productId)) {
			System.out.println("購物車內有一樣的商品，購買數量加1");
			// 設置數量+1
			cart1 = addToCart.get(product.getProductId());
			cart1.setQuantity(cart1.getQuantity() + 1);

		} else {

			System.out.println("有購物車，購物車內增加新商品");
			cart1 = new Cart();
			cart1.setProductId(productId);
			cart1.setProductName(product.getProductName());
			cart1.setPrice(product.getPrice());
			cart1.setQuantity(1);

		}

		// 將此商品項放入addToCart
		addToCart.put(productId, cart1);
		System.out.println("有購物車，已加入購物車");

		// 將購物車放入session
		model.addAttribute("addToCart", addToCart);
		System.out.println("準備離開Controller");
		return cart1;
	}



	// 為了後台更新產品
	@RequestMapping(path = { "/controller.shopping" }, method = RequestMethod.PUT)
	public String updateProduct(Product product, BindingResult bindingResult, Model model) {
		System.out.println("Controller start " + product);
		boolean updateOk = productService.updateProduct(product);
		model.addAttribute("updateOk", updateOk);
		System.out.println("Controller ok ");

		return "page.productsearchtest";
	}

	//商品名搜尋頁面
	@RequestMapping(path = { "/searchProduct.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchText(String searchText, Model model) {
		System.out.println("new controller start " + searchText);
		if (searchText != null && searchText.trim().length() != 0) {
			System.out.println("new controller 1");
			List<Product> products = productService.searchText(searchText);

			int page = 1;
			System.out.println("new controller 2" + products);
			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				// List<Product> page8 = null;

				model.addAttribute("products", products);
				model.addAttribute("page", page);

				System.out.println("new controller out");
				return "page.productsearch";

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";
				// return null;
			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";
		// return null;
	}

	
	//商品利用分頁搜尋頁面
	@RequestMapping(path = { "/searchCatagory.shopping" }, method = RequestMethod.GET)
	public String searchProductFromSearchCategory(String category, Model model) {
		System.out.println("new controller start " + category);
		if (category != null && category.trim().length() != 0) {
			System.out.println("new controller 1");
			List<Product> products = productService.searchByCategory(category);

			int page = 1;
			System.out.println("new controller 2" + products);
			model.addAttribute("page", page);

			if (products != null && !products.isEmpty()) {
				// List<Product> page8 = null;
				model.addAttribute("products", products);
				model.addAttribute("page", page);

				System.out.println("new controller out");
				return "page.productsearch";

			} else {

				model.addAttribute("searchResult0", "沒有相關產品");
				return "page.productsearch";

			}

		}

		model.addAttribute("searchResult0", "請輸入想要的產品");
		return "page.productsearch";

	}

	// 未完成
	@RequestMapping(path = { "/pageChange.shopping" }, method = RequestMethod.GET

	)
	public String nextOrPrevious(String nextORprevious) {

		return null;
	}
}
