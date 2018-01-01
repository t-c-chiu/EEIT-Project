package controller.gift;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.bean.Exchange;
import model.bean.ExchangeDetails;
import model.bean.Gift;
import model.bean.Member;
import model.service.GiftService;

@Controller
public class GiftController {

	@Autowired
	private GiftService giftService;

	@RequestMapping(path = "/selectGift.gift", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8" })
	public @ResponseBody List<Gift> selectGift() {
		return giftService.selectGift();
	}

	@RequestMapping(path = "/insertDetail.gift", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8" })
	public @ResponseBody String insertDetails(int giftId, int number, @SessionAttribute("member") Member member) {
		boolean result = giftService.insertExchangeDetails(giftId, number, member);
		if (result == true) {
			return "加入成功";
		}
		return "加入失敗";
	}
	
	@RequestMapping(path = "/selectDetail.gift", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8" })
	public @ResponseBody List<ExchangeDetails> selectDetails(@SessionAttribute("member") Member member){
		return giftService.selectDetail(member);
	}
	
	@RequestMapping(path = "/deleteDetail.gift", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8" })
	public @ResponseBody String deleteDetailbyId(int exchangeDetailsId) {
		giftService.deleteDetailbyId(exchangeDetailsId);
		return "刪除成功";
	}
	
	@RequestMapping(path = "/insertExchange.gift", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8" })
	public @ResponseBody String insertExchange(@SessionAttribute("member") Member member,Exchange exchange) {
		boolean result=giftService.insertExchange(exchange, member);		
		if (result==true) {
			return "兌換成功";
		}else return "兌換失敗";

		
	}

}
