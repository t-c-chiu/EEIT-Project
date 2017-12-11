package controller.room;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.Member;
import model.bean.Room;
import model.bean.RoomReservation;
import model.service.RoomReservationService;
import model.service.ShowRoomService;

@Controller
@SessionAttributes({"roomReservation"})
public class RoomReservationController {

	@Autowired
	private RoomReservationService roomReservationService;

	@Autowired
	private ShowRoomService showRoomService;

	@InitBinder
	public void intialize(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
//				new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"), true));
	}

	@RequestMapping(path = "/reserve.room", method = RequestMethod.POST)
	public String reserveRoom(@SessionAttribute("member") Member member, RoomReservation roomReservation, Model model) {
		RoomReservation reservation = roomReservationService.insert(member,roomReservation);

		if (reservation == null) {
			return "reserve.error";
		}
		return "reserve.ok";
	}

	@RequestMapping(path = "/show.room", method = RequestMethod.GET)
	public String showRoom(String roomType, Model model) {
		List<Room> listOfRooms;
		listOfRooms = showRoomService.selectRoomByType(roomType);
		model.addAttribute("listOfRooms", listOfRooms);
		return "show.ok";
	}
	
	@RequestMapping(path="/showReservation.room",method=RequestMethod.GET)
	public String selectByMemberId(@SessionAttribute("member") Member member,Model model) {
		List<RoomReservation> listOfReservation;
		listOfReservation =roomReservationService.selectByMemberId(member);
		model.addAttribute("listOfReservation",listOfReservation);
		return "showReservation.ok";		
	}

}
