package controller.room;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.bean.Member;
import model.bean.PointDetails;
import model.bean.Room;
import model.bean.RoomReservation;
import model.service.RoomReservationService;

@Controller
@SessionAttributes({ "roomReservation", "listOfRooms", "newPoint", "area", "roomType", "member" })
public class RoomReservationController {

	@Autowired
	private ServletContext application;

	@Autowired
	private RoomReservationService roomReservationService;

	@InitBinder
	public void intialize(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				// new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"), true));
	}

	@RequestMapping(path = "/reserve.room", method = RequestMethod.POST)
	public String reserveRoom(@SessionAttribute("member") Member member, RoomReservation roomReservation, Model model,
			int newPoint, PointDetails pointDetails) {
		roomReservationService.insert(member, roomReservation, newPoint, pointDetails);
		model.addAttribute("newPoint", newPoint);
		member.setPoint(newPoint);// 配合更新session用
		model.addAttribute("member", member);// 配合更新session用,加到"member"物件(會員中心)

		return "reserve.ok";
	}

	@RequestMapping(path = "/show.room", method = RequestMethod.GET)
	public String showRoom(String roomType, String area, Model model) {
		List<Room> listOfRooms;
		listOfRooms = roomReservationService.selectRoomByType(roomType, area);
		model.addAttribute("listOfRooms", listOfRooms);
		model.addAttribute("roomType", roomType);
		model.addAttribute("area", area);
		return "show.ok";
	}

	// 整頁跳轉
	// @RequestMapping(path="/insertRoom.room",method=RequestMethod.POST)
	// public String insertRoom(Room room) {
	// roomReservationService.insertRoom(room);
	// return "insertRoom.ok";
	// }

	@RequestMapping(path = "/insertRoom.room", method = RequestMethod.POST, produces = { "text/plain;charset=UTF-8" })
	public @ResponseBody String insertRoom(Room room, MultipartFile photo) {
		roomReservationService.insertRoom(room);
		String ImageId = room.getRoomImage();
		String name = photo.getOriginalFilename();
		String mineType = application.getMimeType(name);
		String expandedName = "";
		if (mineType.equals("image/jpeg")) {
			expandedName = ".jpg";
		} else if (mineType.equals("image/png")) {
			expandedName = ".png";
		} else if (mineType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (mineType.equals("image/bmp")) {
			expandedName = ".bmp";
		}
		name = ImageId + expandedName;
		try {
			photo.transferTo(new File(application.getRealPath("/images/room"), name));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "新增成功";
	}

	// 依照類別排序 沒用到
	@RequestMapping(path = "/getRoombyOrder.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<Room> showRoomJson(String order, Model model) {
		return roomReservationService.selectByOrder(order);
	}

	@RequestMapping(path = "/showReservation.room", method = RequestMethod.GET)
	public String selectByMemberId(@SessionAttribute("member") Member member, Model model) {
		List<RoomReservation> listOfReservation;
		listOfReservation = roomReservationService.selectByMemberId(member);
		model.addAttribute("listOfReservation", listOfReservation);
		return "showReservation.ok";
	}

	@RequestMapping(path = "/showByRoomId.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<RoomReservation> selectByRoomId(int roomId) {
		return roomReservationService.selectByRoomId(roomId);
	}

	@RequestMapping(path = "/selectAllReservation.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<RoomReservation> selectAllReservation() {
		return roomReservationService.selectAllReservation();
	}

	@RequestMapping(path = "/selectAllRoom.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<Room> selectAllRoom() {
		return roomReservationService.selectAllRoom();
	}

	// 整頁跳轉刪除訂單
	// @RequestMapping(path="/deleteReservation.room",method=RequestMethod.GET)
	// public String delete(int roomReserverId,Model model) {
	// boolean deleteResult=roomReservationService.delete(roomReserverId);
	// Map<String,String> messages=new HashMap<>();
	// model.addAttribute("messages", messages);
	// model.addAttribute("deleteResult",deleteResult);
	// if(deleteResult==true) {
	// messages.put("m1", "刪除成功");
	// return"delete.ok";
	// }
	// return null;
	// }

	@RequestMapping(path = "/deleteReservation.room", method = RequestMethod.POST, produces = {
			"text/plain;charset=UTF-8" })
	public @ResponseBody String delete(int roomReserverId) {
		roomReservationService.delete(roomReserverId);
		return "刪除成功";
	}

	@RequestMapping(path = "/getMemberbyId.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody Member selectMemberById(@SessionAttribute("member") Member member) {
		return roomReservationService.selectMemberById(member);
	}

	@RequestMapping(path = "/getRoombyArea.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<String> selectByArea(String area) {
		return roomReservationService.selectByArea(area);
	}

	@RequestMapping(path = "/getRoombyPrice.room", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody List<Room> selectByPrice(int price, @SessionAttribute("roomType") String roomType,
			@SessionAttribute("area") String area) {
		return roomReservationService.selectByPrice(price, roomType, area);
	}

}
