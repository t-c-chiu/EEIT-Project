package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Gift;
import model.dao.GiftDAO;

@Service
@Transactional
public class GiftService {
	
	@Autowired
	GiftDAO giftDAO;
	
	public List<Gift> selectGift(){
		return giftDAO.selectGift();		
	}

}
