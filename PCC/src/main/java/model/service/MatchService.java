package model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Matching;
import model.bean.Member;
import model.bean.Reservation;
import model.bean.Servant;
import model.dao.MatchingDAO;

@Service
@Transactional
public class MatchService {
	@Autowired
	private MatchingDAO matchDao;
	// static List<String> strSendContentList = new ArrayList<String>();
	static Map<String, List<String>> strSendContentMap = new HashMap<String, List<String>>();

	// 撈取服務料表
	public List<Servant> showServantList() {
		List<Servant> data = matchDao.selectServantList();
		return data;
	}

	// 決定預約表是否完成
	public Boolean completeReservationForm(String memberId) {
		Integer reservation = matchDao.selectCountByMemberId(memberId);
		System.out.println(reservation);
		if (reservation == 0) {
			return false;
		}
		return true;
	}

	// 新增新預約表
	public Boolean insertReservationForm(Reservation reservation) {
		return matchDao.insertReservationForm(reservation);
	}

	// 坐月子-服務員 對應map 拿訊息清單
	public String chatList(String customerID, String serviceId) {
		List<String> result = strSendContentMap.get(customerID + "-" + serviceId);
		String message = "";
		if (result == null) {
			strSendContentMap.put(customerID + "-" + serviceId, new ArrayList<String>());
			result = strSendContentMap.get(customerID + "-" + serviceId);
		}
		if (result.size() == 0) {
			message = "還沒有聊天記錄";
		} else {
			Iterator<String> it = result.iterator();
			while (it.hasNext()) {
				message += it.next() + "</br>";
			}
		}
		return message;
	}

	// 坐月子-服務員 對應map 訊息存到訊息清單
	public Boolean sendContent(String customerID, String serviceId, String content, String name) {
		List<String> result = strSendContentMap.get(customerID + "-" + serviceId);
		String str = name + " 於 " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) + " 說:  "
				+ content;
		if (result == null) {
			strSendContentMap.put(customerID + "-" + serviceId, new ArrayList<String>());
			strSendContentMap.get(customerID + "-" + serviceId).add(str);
		} else {
			result.add(str);
		}
		return true;
	}

	// 拿訊息清單
	// public String ChatList() {
	// String result = "";
	// if (strSendContentList.size() == 0) {
	// result = "還沒有聊天紀錄";
	// } else {
	// Iterator<String> it = strSendContentList.iterator();
	// while (it.hasNext()) {
	// result += it.next() + "</br>";
	// }
	// }
	// return result;
	// }

	// 訊息傳到訊息清單
	// public Boolean SendContent(String content, HttpSession session) {
	// String user = (String) session.getAttribute("member");
	// // String name = session.getAttribute("LOGINUSER").toString();
	// if (null == user) {
	// return false;
	// }
	//
	// String strSendCotent = user + " 於 " + new SimpleDateFormat("yyyy-MM-dd
	// HH:mm:ss").format(new java.util.Date()) + " 說: " + content;
	// if (strSendContentList.size() == 0) {
	// strSendContentList = new ArrayList<String>();
	// }
	// strSendContentList.add(strSendCotent);
	// return true;
	// }

	// 選擇服務員後加進配對表 有配對表controller直接跳轉會員中心
	public Boolean matching(String memberId, int servantId) {
		int reservationId = matchDao.selectReservationId(memberId);
		String idMapping = reservationId + "-" + servantId;
		Integer hasMatching = matchDao.selectCountByMappingId(idMapping);
		if (hasMatching == 1) {
			return true;
		}
		Matching mBean = new Matching();
		mBean.setReservationId(reservationId);
		mBean.setServiceId(servantId);
		matchDao.insertMatchingForm(mBean);
		return false;
	}

	// *預約者選擇[配對清單]的服務員
	public List<Object[]> selectServantName(String memberId) {
		return matchDao.selectServantName(matchDao.selectReservationId(memberId));
	}

	// *服務員選擇[配對清單]的預約者
	public List<Object[]> selectReservationName(String memberId) {
		System.out.print(matchDao.selectReservationName(memberId));
		return matchDao.selectReservationName(memberId);
	}

	// 預約者選擇服務員資訊 服務員選擇預約者資訊
	public Object idInformation(Member member, String memId, Servant servant) {
		if (member != null)
			return matchDao.selectServantInfo(memId);
		else
			return matchDao.selectReservationInfo(memId);
	}

}
