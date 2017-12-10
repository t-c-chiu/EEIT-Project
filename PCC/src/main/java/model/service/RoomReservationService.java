package model.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Member;
import model.bean.RoomReservation;
import model.dao.RoomReservationDAO;

@Service
@Transactional
public class RoomReservationService {
	
	@Autowired
	RoomReservationDAO roomReservationDAO;
	
	public RoomReservation insert(Member member,RoomReservation bean) {
		RoomReservation result=null;
		if(bean!=null) {
			bean.setMemberId(member.getMemberId());
			result=roomReservationDAO.insert(bean);
		}
		return result;			
	};

}
