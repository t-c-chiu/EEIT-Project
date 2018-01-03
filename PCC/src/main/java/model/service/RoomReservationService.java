package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Member;
import model.bean.PointDetails;
import model.bean.Room;
import model.bean.RoomReservation;
import model.dao.MemberDAO;
import model.dao.PointDetailsDAO;
import model.dao.RoomDAO;
import model.dao.RoomReservationDAO;
import model.dao.SystemMessageDAO;

@Service
@Transactional
public class RoomReservationService {

	@Autowired
	RoomReservationDAO roomReservationDAO;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	RoomDAO roomDAO;

	@Autowired
	PointDetailsDAO pointDetailsDAO;
	
	@Autowired
	SystemMessageDAO systemMessageDAO;

	public boolean insert(Member member, RoomReservation roomReservation, int newPoint, PointDetails pointDetails) {
		String memberId=member.getMemberId();		
		roomReservation.setMemberId(memberId);
		roomReservationDAO.insert(roomReservation);
		pointDetails.setMemberId(memberId);
		pointDetailsDAO.insertPoint(pointDetails);
		memberDAO.updateMemberPoint(member, newPoint);		
		systemMessageDAO.insert(memberId, "訂房成功！", "謝謝您的訂房 "+memberId+"一共: "+roomReservation.getTotalPrice()+" 請盡快付款!");
		
		return true;
	};

	public List<RoomReservation> selectByMemberId(Member member) {
		return roomReservationDAO.selectByMemberId(member.getMemberId());
	}

	public List<RoomReservation> selectAllReservation() {
		return roomReservationDAO.selectAllReservation();
	}

	public boolean delete(int roomReserverId) {
		roomReservationDAO.delete(roomReserverId);
		return true;
	}

	public List<RoomReservation> selectByRoomId(int roomId) {
		return roomReservationDAO.selectByRoomId(roomId);
	}

	public Member selectMemberById(Member member) {
		return memberDAO.select(member.getMemberId());
	}

	public List<Room> selectRoomByType(String roomType, String area) {	
		if (area.trim().length()==0) {
			return roomDAO.selectByRoomType(roomType);
		}	
		return roomDAO.selectByType(roomType, area);
	}

	public List<Room> selectByOrder(String order) {
		return roomDAO.selectByOrder(order);
	}

	public List<String> selectByArea(String area) {
		return roomDAO.selectByArea(area);
	}

	public List<Room> selectByPrice(int price, String roomType, String area) {
		if(area.trim().length()==0) {
			return roomDAO.selectByPriceAndType(price, roomType);
		}		
		return roomDAO.selectByPrice(price, roomType, area);
	}

	public List<Room> selectAllRoom() {
		return roomDAO.selectAllRoom();
	}

	public boolean insertRoom(Room room) {
		room.setInfo(room.getInfo().substring(1));
		return roomDAO.insertRoom(room);
	}

}
