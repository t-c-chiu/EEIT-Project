package controller.match;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.service.ServantService;

@Controller
@SessionAttributes({"servantList"})
public class MatchController {
    @Autowired
    public ServantService service;

    @RequestMapping(path="/test.match", method = RequestMethod.GET)   
    public String method(Model model) {
    	
    	List<List> servantList = service.showServantList();
//    	Map<String, String> testMap = new HashMap<String, String>();
//    	testMap.put("xxx", sdf);

    	
        
    	model.addAttribute("servantList", servantList);
    	return "show";
    }
}
