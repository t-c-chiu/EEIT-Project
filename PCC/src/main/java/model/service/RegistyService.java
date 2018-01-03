package model.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Member;
import model.bean.PointDetails;
import model.dao.MemberDAO;
import model.dao.PointDetailsDAO;

@Service
@Transactional
public class RegistyService {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private PointDetailsDAO pointDetailsDAO;

	public Member registy(Member member) {
		Member resulte = null;
		if (member != null) {
			member.setRole(2);
			member.setStatus(0);
			member.setPoint(50);
			resulte = memberDao.insertRegisty(member);
			
			
		}
		return resulte;
	}
	
	public PointDetails insertMemberFirstTime(PointDetails pointDetails) {
			//註冊 後 SELECT memerId !=null 就 INSERT pointDetails
			Date date=new Date();
			pointDetails.setGettingDate(date);
			pointDetails.setGetWay("會員註冊成功");
			pointDetails.setGetPoint(50);
			pointDetailsDAO.insertPointDetails(pointDetails);
//			System.out.println("The pointDetails="+pointDetails);
			return pointDetails;

	}

	public Member checkMemberId(String memberId) {
		Member check = memberDao.select(memberId);
		if (check != null) {
			return check;
		}
		return null;
	}

}
