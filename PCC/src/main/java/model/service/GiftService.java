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

}
