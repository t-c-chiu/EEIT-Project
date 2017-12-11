package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.Room;
import model.dao.RoomDAO;

@Service
public class ShowRoomService {
	
	@Autowired
	RoomDAO roomDAO;
	
	public List<Room> selectRoomByType(String roomType){
		return roomDAO.selectByType(roomType);
	}
	

}
