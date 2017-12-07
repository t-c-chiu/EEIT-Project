package controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.service.RoomReservationService;

@Controller
@RequestMapping("/roomreservation.controller")
public class RoomReservationController {
	
	@Autowired
	private RoomReservationService roomReservationService;
	
	@InitBinder
	public void intialize(WebDataBinder webDataBinder) {		
		webDataBinder.registerCustomEditor(java.util.Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy/MM/dd"), true));
				
	}
	
	@RequestMapping(method= {RequestMethod.POST})
	public void method() {
		
	}
	
	
	
	
	
	

}
