package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Exchange;
import model.bean.ExchangeDetails;
import model.bean.Gift;
import model.bean.Member;
import model.dao.ExchangeDAO;
import model.dao.ExchangeDetailsDAO;
import model.dao.GiftDAO;

@Service
@Transactional
public class GiftService {
	
	@Autowired
	GiftDAO giftDAO;
	
	@Autowired
	ExchangeDetailsDAO exchangeDetailsDAO;
	
	@Autowired
	ExchangeDAO exchangeDAO;
	
	public List<Gift> selectGift(){
		return giftDAO.selectGift();		
	}
	
	public boolean insertExchangeDetails(int giftId,int number,Member member) {
		Gift gift=giftDAO.selectGiftById(giftId);
		ExchangeDetails exchangeDetails=new ExchangeDetails();
		exchangeDetails.setGiftName(gift.getGiftName());
		exchangeDetails.setPoint(gift.getPoint());	
		exchangeDetails.setGiftId(giftId);				
		exchangeDetails.setMemberId(member.getMemberId());
		exchangeDetails.setNumber(number);		
		return exchangeDetailsDAO.insertExchangeDetails(exchangeDetails);
	}
	
	public List<ExchangeDetails> selectDetail(Member member){
		return exchangeDetailsDAO.selectDetail(member.getMemberId());		
	}
	
	public boolean deleteDetailbyId(int exchangeDetailsId) {
		return exchangeDetailsDAO.deleteDetailbyId(exchangeDetailsId);
	}
	
	public boolean insertExchange(Exchange exchange,Member member) {
		String memberId=member.getMemberId();
		exchange.setMemberId(memberId);
		int exchangeId=exchangeDAO.insertExchange(exchange);		
		List<ExchangeDetails> details=exchangeDetailsDAO.selectDetail(memberId);
		//update 禮物名細的狀態跟exchangeId
		for(ExchangeDetails detail:details) {
			detail.setExchangeId(exchangeId);
			detail.setStatus(1);
			Gift gift=giftDAO.selectGiftById(detail.getGiftId());
			gift.setStock(gift.getStock()-detail.getNumber());		    
		}
		return true;
	}

}
