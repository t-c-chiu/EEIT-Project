package controller.room;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.bean.RoomReservation;
import model.service.RoomReservationService;

@Controller
@RequestMapping("/controller.room")
public class RoomReservationController {
	
	@Autowired
	private RoomReservationService roomReservationService;
	
	@InitBinder
	public void intialize(WebDataBinder webDataBinder) {		
		webDataBinder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor(new SimpleDateFormat("MM/dd/yyyy"), true));
				
	}
	
	@RequestMapping(method= {RequestMethod.POST})
	public String method(RoomReservation bean,Model model) {
		RoomReservation result=roomReservationService.insert(bean);
		
		if(result==null) {
			return "reserve.error";
		}
		return "reserve.ok" ;
					
	}
	
}
