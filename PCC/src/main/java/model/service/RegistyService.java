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

	public Member registy(Member member) {
		Member resulte = null;
		if (member != null) {
			member.setRole(1);
			member.setStatus(0);
			member.setPoint(50);
			resulte = memberDao.insertRegisty(member);
		}
		return resulte;
	}

	public Member checkMemberId(String memberId) {
		Member check = memberDao.select(memberId);
		if (check != null) {
			return check;
		}
		return null;
	}

}
