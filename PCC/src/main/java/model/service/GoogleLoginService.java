package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.MemberDAO;

@Service
@Transactional
public class GoogleLoginService {
	@Autowired
	private MemberDAO memberDAO;
	
	public Member update(Member member) {
		Member bean = memberDAO.update(member);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
}
