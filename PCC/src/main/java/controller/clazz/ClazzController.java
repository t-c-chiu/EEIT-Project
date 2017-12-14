package controller.clazz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.Clazz;
import model.service.ClazzService;

@Controller
public class ClazzController {

	@Autowired
	ClazzService clazzService;

	@RequestMapping(path = "/startClass.clazz")
	public String startClass(Clazz clazz) {
		
		
		
		return "";
	}

}
