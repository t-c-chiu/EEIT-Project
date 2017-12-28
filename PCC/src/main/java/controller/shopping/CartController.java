package controller.shopping;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@SessionAttributes(value = { "addToCart" })
public class CartController {
	@Autowired
	private ProductService productService;
	private Map<Integer, Cart> addToCart;

	@InitBinder
	public void initlization(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));

	}
	
	//除去購物車內的商品
	//前往購物車頁面
	
	@RequestMapping(path = { "/eliminate.shopping" }, method = RequestMethod.POST ,produces = {
	"application/json;charset=UTF-8" })
	public @ResponseBody Map<Integer, Cart> eliminateItem(int productId, Model model,HttpSession session) {
//		System.out.println("進來除去購物頁面啦");
		addToCart = (Map<Integer, Cart>) session.getAttribute("addToCart");
		
		addToCart.remove(productId);
		
		session.setAttribute("addToCart", addToCart);
//		System.out.println("購物車內還剩下： "+session.getAttribute("addToCart"));
		return addToCart;	
	}


	
	// 購物車加入功能
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
//			System.out.println("in 判斷是否有購物車");
			addToCart = new HashMap<Integer, Cart>();
		}

		// 判斷是否存在商品編號的鍵
		Cart cart1 = null;
		if (addToCart.containsKey(productId)) {
//			System.out.println("購物車內有一樣的商品，購買數量加1");
			// 設置數量+1
			cart1 = addToCart.get(product.getProductId());
			cart1.setQuantity(cart1.getQuantity() + 1);

		} else {

//			System.out.println("有購物車，購物車內增加新商品");
			cart1 = new Cart();
			cart1.setProductId(productId);
			cart1.setProductName(product.getProductName());
			cart1.setPrice(product.getPrice());
			cart1.setQuantity(1);

		}

		// 將此商品項放入addToCart
		addToCart.put(productId, cart1);
//		System.out.println("有購物車，已加入購物車");

		// 將購物車放入session
		model.addAttribute("addToCart", addToCart);
//		System.out.println("準備離開Controller");
		return cart1;
	}
	
	//前往購物車頁面
	@RequestMapping(path = { "/goToCart.shopping" }, method = RequestMethod.GET)
	public String useCartPage(HttpSession session,int productId, Model model) {
		
		session.getAttribute("addToCart");
		
		
		
		
		return null;	
	}
}
