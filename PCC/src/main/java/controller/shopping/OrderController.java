package controller.shopping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.Member;
import model.bean.Order;

@Controller
public class OrderController {

	//新增商品
	@RequestMapping(path= {"/insertOrder.shopping"},method=RequestMethod.POST)
	public String insert(Member member,Order order) {
		System.out.println("member"+member);
		System.out.println("order"+order);
		
		//增加訂單
		//增加訂單明細
		return null;
	}
}
