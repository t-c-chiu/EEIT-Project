package model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Clazz;
import model.bean.Member;
import model.bean.Order;
import model.bean.RoomReservation;
import model.dao.ClazzDAO;
import model.dao.MemberDAO;
import model.dao.OrderDAO;
import model.dao.RoomReservationDAO;
import model.dao.StudentDAO;

@Service
@Transactional
public class MemberCenterService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private RoomReservationDAO roomReservationDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ClazzDAO clazzDAO;
	
	public Member updatePSW(Member member) {
		member=memberDAO.updatePSW(member);
		System.out.println("service member="+member);
		return member;
	}

	public Map<String, Object> showMyBePaidList(String memberId) {
		List<RoomReservation> listOfMyReservation = roomReservationDAO.selectByMemberId(memberId);
		for (RoomReservation roomReservation : listOfMyReservation) {
			if (roomReservation.getStatus() == 1) {
				listOfMyReservation.remove(roomReservation);
			}
		}

		List<Clazz> listOfMyClazz = new ArrayList<>();
		for (Integer classId : studentDAO.selectClassIdByMemberIdStatus0(memberId)) {
			listOfMyClazz.add(clazzDAO.selectByClassId(classId));
		}

		List<Order> listOfMyOrder = orderDAO.selectAllByMemberIdStatus0(memberId);

		Map<String, Object> map = new HashMap<>();
		map.put("listOfMyReservation", listOfMyReservation);
		map.put("listOfMyClazz", listOfMyClazz);
		map.put("listOfMyOrder", listOfMyOrder);
		return map;
	}

}
