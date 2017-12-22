package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.MemberDAO;

@Service
@Transactional
public class MemberCenterService {
	@Autowired
	private MemberDAO memberDAO;
	
	public Member updatePersonal(Member member) {
		
		return null;
	}

}
