package controller.gift;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Gift;
import model.service.GiftService;

@Controller
public class GiftController {
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping(path="/selectGift.gift",method=RequestMethod.GET,produces={"application/json;charset=UTF-8"})
	public @ResponseBody List<Gift> selectGift(){
		return giftService.selectGift();		
	}
	
}
