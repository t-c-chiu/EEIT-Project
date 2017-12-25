package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.SystemMessage;
import model.dao.SystemMessageDAO;

@Service
@Transactional
public class SystemMessageService {

	@Autowired
	private SystemMessageDAO systemMessageDAO;

	public List<SystemMessage> showMySystemMsg(String memberId) {
		return systemMessageDAO.selectAllByMemberId(memberId);
	}
	
	public String alreadyRead(Integer systemMessageId) {
		systemMessageDAO.selectBySystemMessageId(systemMessageId).setStatus(1);
		return "已讀";
	}

}
