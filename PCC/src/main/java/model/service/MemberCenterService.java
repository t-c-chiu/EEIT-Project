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
import model.bean.Student;
import model.dao.ClazzDAO;
import model.dao.OrderDAO;
import model.dao.RoomReservationDAO;
import model.dao.StudentDAO;

@Service
@Transactional
public class MemberCenterService {

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
		List<RoomReservation> listOfMyReservation = roomReservationDAO.selectAllByMemberIdStatus0(memberId);

		List<Clazz> listOfMyClazz = new ArrayList<>();
		for (Integer classId : studentDAO.selectClassIdByMemberIdStatus0(memberId)) {
			Clazz clazz = clazzDAO.selectByClassId(classId);
			if (clazz.getStatus() == 1)
				listOfMyClazz.add(clazz);
		}

		List<Order> listOfMyOrder = orderDAO.selectAllByMemberIdStatus0(memberId);

		Map<String, Object> map = new HashMap<>();
		map.put("listOfMyReservation", listOfMyReservation);
		map.put("listOfMyClazz", listOfMyClazz);
		map.put("listOfMyOrder", listOfMyOrder);
		return map;
	}

	public String checkOut(String memberId) {
		for (Student student : studentDAO.selectByMemberId(memberId)) {
			if (clazzDAO.selectByClassId(student.getClassId()).getStatus() == 1)
				student.setStatus(1);
		}
		for (Order order : orderDAO.selectAllByMemberIdStatus0(memberId)) {
			order.setStatus(1);
		}
		for (RoomReservation roomReservation : roomReservationDAO.selectByMemberId(memberId)) {
			roomReservation.setStatus(1);
		}
		return "結帳成功";
	}

}
