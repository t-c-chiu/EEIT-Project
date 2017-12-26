package controller.systemmsg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.bean.Member;
import model.bean.SystemMessage;
import model.service.SystemMessageService;

@Controller
public class SystemMessageController {

	@Autowired
	private SystemMessageService systemMessageService;

	@RequestMapping(path = "/showMySystemMsg.sysMsg", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody List<SystemMessage> showMySystemMsg(@SessionAttribute("member") Member member) {
		return systemMessageService.showMySystemMsg(member.getMemberId());
	}

	@RequestMapping(path = "/alreadyRead.sysMsg", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String alreadyRead(Integer systemMessageId) {
		return systemMessageService.alreadyRead(systemMessageId);
	}

}
