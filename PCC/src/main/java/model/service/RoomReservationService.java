package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Member;
import model.bean.Room;
import model.bean.RoomReservation;
import model.dao.MemberDAO;
import model.dao.RoomDAO;
import model.dao.RoomReservationDAO;

@Service
@Transactional
public class RoomReservationService {

	@Autowired
	RoomReservationDAO roomReservationDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	RoomDAO roomDAO;
	
	public int insert(Member member, RoomReservation roomReservation,int newPoint) {	
		roomReservation.setMemberId(member.getMemberId());
		roomReservation = roomReservationDAO.insert(roomReservation);
		memberDAO.updateMemberPoint(member, newPoint);
		return newPoint;
	};
	
	public List<RoomReservation> selectByMemberId(Member member) {						
		return roomReservationDAO.selectByMemberId(member.getMemberId());		
	}
	
	public boolean delete(int roomReserverId) {
		roomReservationDAO.delete(roomReserverId);
		return true;
	}
	
	public List<RoomReservation> selectByRoomId(int roomId){
		return roomReservationDAO.selectByRoomId(roomId);
	}
	
	public Member selectMemberById(Member member) {
		return memberDAO.select(member.getMemberId());
	}
	
	
	public List<Room> selectRoomByType(String roomType,String area){
		return roomDAO.selectByType(roomType,area);
	}
	
	public List<Room> selectByOrder(String order){
		return roomDAO.selectByOrder(order);
	}
	
	public List<String> selectByArea(String area){
		return roomDAO.selectByArea(area);
	}
	
	public List<Room> selectByPrice(int price){
		return roomDAO.selectByPrice(price);
	}
	
}
