package model.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Matching;
import model.bean.Reservation;
import model.bean.Servant;
import model.dao.MatchingDAO;
import model.dao.ReservationDAO;
import model.dao.ServantDAO;
import model.dao.SystemMessageDAO;

@Service
@Transactional
public class MatchService {
	@Autowired
	private MatchingDAO matchDao;
	@Autowired
	private ReservationDAO reservationDAO;
	@Autowired
	private ServantDAO servantDAO;
	@Autowired
	private SystemMessageDAO systemMessageDAO;

	// 撈取服務料表
	public List<Servant> showServantList() {
		List<Servant> data = servantDAO.selectServantList();
		return data;
	}

	// 決定預約表是否完成
	public Boolean completeReservationForm(String memberId) {
		Integer reservation = reservationDAO.selectCountByMemberId(memberId);
		System.out.println(reservation);
		if (reservation == 0) {
			return false;
		}
		return true;
	}

	public Boolean insertReservationForm(Reservation reservation) {
		return reservationDAO.insertReservationForm(reservation);
	}

	// 選擇服務員後加進配對表 有配對表controller直接跳轉會員中心
	public String matching(String memberId, int serviceId) {
		int reservationId = reservationDAO.selectReservationId(memberId);
		List<Matching> listOfMatching = matchDao.selectByReservationId(reservationId);
		for (Matching matching : listOfMatching) {
			if (matching.getServiceId() == serviceId)
				return "你已經選擇過此服務員，請等待管理員審核，可至會員中心查看。";
		}
		Matching matching = new Matching();
		matching.setReservationId(reservationId);
		matching.setServiceId(serviceId);
		matching.setStatus(0);
		matching.setDate(new Date());
		matchDao.insert(matching);
		systemMessageDAO.insert(memberId, "配對服務",
				"您已經選擇了" + servantDAO.selectByServiceId(serviceId).getName() + "做為您的服務員，請等待管理員審核。");
		return "選擇成功，等待管理員審核。";
	}

	public List<Object[]> showMyMatching(String memberId) {
		return matchDao.selectMatchingAndServantByReservationId(reservationDAO.selectReservationId(memberId));
	}
}
