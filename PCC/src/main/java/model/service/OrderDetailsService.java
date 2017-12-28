package model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Cart;
import model.bean.OrderDetail;

@Service
@Transactional
public class OrderDetailsService {

	
	public boolean insertOrderDetails(Map<Integer,Cart> map) {
		List<OrderDetail> listOrderDetail =new ArrayList<OrderDetail>();
		for(Object key: map.keySet()) {
			
//			listOrderDetail.add(map.get(key));
		}
		
		return false;
	}
	
	
}
