package controller.shopping;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Cart;
import model.bean.Member;
import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.PointDetails;
import model.bean.Product;
import model.dao.SystemMessageDAO;
import model.service.MemberService;
import model.service.OrderService;
import model.service.PointDetailsService;
import model.service.ProductService;

@Controller
@SessionAttributes(value = { "addToCart" })
public class CartController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SystemMessageDAO systemMessageDAO;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PointDetailsService pointDetailsService;
	

	//除去購物車內的商品
	//前往購物車頁面
	@RequestMapping(path = { "/eliminate.shopping" }, method = RequestMethod.POST ,produces = {
	"application/json;charset=UTF-8" })
	public @ResponseBody Map<Integer, Cart> eliminateItem(int productId, Model model,HttpSession session) {

		 Map<Integer, Cart> addToCart = (Map<Integer, Cart>) session.getAttribute("addToCart");
		
		addToCart.remove(productId);
		
		session.setAttribute("addToCart", addToCart);

		return addToCart;	
	}


	
	// 購物車加入功能
	@RequestMapping(path = { "/addCart.shopping" }, method = RequestMethod.POST, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody Cart addCart(int productId, Model model,int number ,HttpServletRequest request) {


		Product product = productService.search(productId);

		Map<Integer, Cart> addToCart = (Map<Integer, Cart>) request.getSession().getAttribute("addToCart");

		// 判斷是否存在
		if (addToCart == null) {
			// 創建購物車

			addToCart = new HashMap<Integer, Cart>();
		}

		// 判斷是否存在商品編號的鍵
		Cart cart1 = null;
		if (addToCart.containsKey(productId)) {

			// 設置數量+1
			cart1 = addToCart.get(product.getProductId());
			cart1.setQuantity(cart1.getQuantity() + number);

		} else {


			cart1 = new Cart();
			cart1.setProductId(productId);
			cart1.setProductName(product.getProductName());
			cart1.setPrice(product.getPrice());
			cart1.setQuantity(1);
			cart1.setPictureAscii(product.getPictureAscii());

		}

		// 將此商品項放入addToCart
		addToCart.put(productId, cart1);


		// 將購物車放入session
		model.addAttribute("addToCart", addToCart);

		return cart1;
	}

	
	
	//將商品加入訂單，狀態為0
	@RequestMapping(path = { "/addOrder.shopping" }, method = RequestMethod.GET,produces= {"text/plain;charset=UTF-8" })
	public @ResponseBody String useCartPage(Order order,HttpSession session,OrderDetail orderDetail ,PointDetails pointDetails,Model model) {
	
		if (order!=null) {
			//1.先成立訂單
			Member member = (Member) session.getAttribute("member");
			
			if(member==null) {
				return "請先登入";
				
			}
			
			
			
			String memberId = member.getMemberId();
			Date today = new Date();
			order.setDate(today);
			order.setMemberId(memberId);
			int orderId = orderService.insertOrder(order);
			//2.加入訂單明細
			Map<Integer, Cart> map = (Map<Integer, Cart>) session.getAttribute("addToCart");
			List<OrderDetail> listOrderDetail = new ArrayList<OrderDetail>();
			for (Object key : map.keySet()) {
				orderDetail.setOrderId(orderId);
				orderDetail.setPrice(map.get(key).getPrice());
				orderDetail.setQuantity(map.get(key).getQuantity());
				orderDetail.setProductName(map.get(key).getProductName());
				orderDetail.setProductId(map.get(key).getProductId());

				listOrderDetail.add(orderDetail);
			}
			//3.把購物車清除
			map.clear();
			model.addAttribute("addToCart", map);
			//4.發送系統信
			systemMessageDAO.insert(memberId, "新增訂單編號：" + orderId, "已加入訂單，記得去會員中心的購物車結帳喔~~");
			//5.將購物的金錢轉成點數，500元一點 。並新增到會員總點數和點數明細中
			int total= order.getTotalPrice();
			Integer opint =total/500;
			
			pointDetails.setGettingDate(today);
			pointDetails.setGetWay("購物");
			pointDetails.setMemberId(memberId);
			pointDetails.setGetPoint(opint);
			pointDetailsService.insertPointDetail(pointDetails);
			
			int p=member.getPoint();
			member.setPoint((p+opint));
			memberService.updatePersonal(member);
			
			
			return "加入訂單成功!!";	
		}
		
		return"加入訂單失敗";
	}
}

