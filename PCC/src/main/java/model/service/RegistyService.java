package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.dao.MemberDAO;

@Service
@Transactional
public class RegistyService {
	@Autowired
	private MemberDAO memberDao;
	
	public Member registy(Member bean) {
		Member resulte=null;
		if(bean!=null) {
			resulte = memberDao.insertRegisty(bean);
		}
		return resulte;
	}

}
