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

	public RoomReservation insert(Member member, RoomReservation roomReservation) {
		roomReservation.setMemberId(member.getMemberId());
		roomReservation = roomReservationDAO.insert(roomReservation);

		return roomReservation;
	};

}
