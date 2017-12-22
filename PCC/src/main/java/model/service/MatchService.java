package model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Matching;
import model.bean.Reservation;
import model.bean.Servant;
import model.dao.MatchingDAO;

@Service
@Transactional
public class MatchService {
    @Autowired
    private MatchingDAO matchDao;
    static List<String> strSendContentList = new ArrayList<String>();
    static Map<String, List<String>> strSendContentMap = new HashMap<String, List<String>>();
    
    
    // 撈取服務料表
    public List<List> showServantList() {
    	  	
    	List servantList2 = new ArrayList();
    	List<Object[]> data = matchDao.selectServantList();
    	for (int i=0; i<data.size(); i++) {   		
    		List servantList1 = new ArrayList();   		
    		Object[] array = data.get(i);
    		Servant bean = (Servant) array[0];
    		servantList1.add(bean.getServiceId());
    		servantList1.add(bean.getExperience());
    		servantList1.add(bean.getStatus());
    		servantList1.add(bean.getMemberId());
    		servantList1.add(bean.getType());
    		servantList1.add(bean.getIntroduction());   		
    		String memberName = (String) array[1];
    		servantList1.add(memberName);
    		servantList2.add(servantList1);
    	}   	   	
    	return servantList2;
    }  

    // 決定預約表是否完成
    public Boolean CompleteReservationForm(String memberId) {
    	Integer reservation = matchDao.selectCountByMemberId(memberId);
    	System.out.println(reservation);
    	if(reservation == 0) {
    		return false;
    	}
    	return true;
    }
    
    // 新增新預約表
    public Boolean insertReservationForm(Reservation reservation) {   	
    	return matchDao.insertReservationForm(reservation);
    }
 
    // 坐月子-服務員 對應map
    public List<String> test(int customerID, int ServiceId, String message) {
    	List<String> result = strSendContentMap.get(customerID + "-" + ServiceId);
    	
    	if(result == null) {
    		strSendContentMap.put(customerID + "-" + ServiceId, new ArrayList<String>());
    		strSendContentMap.get(customerID + "-" + ServiceId).add(message);
    	} else {
    		result.add(message);
    	}
    	return result;
    }
    
    // 拿訊息清單
  	public String ChatList() {
  		String result = "";
  		if (strSendContentList.size() == 0) {
  			result = "還沒有聊天紀錄";
  		} else {
  			Iterator<String> it = strSendContentList.iterator();
  			while (it.hasNext()) {
  				result += it.next() + "</br>";
  			}
  		}
  		return result;
  	}

  	
  	// 訊息傳到訊息清單
  	public Boolean SendContent(String content, HttpSession session) {
//  		String user = (String) session.getAttribute("member");
  //
//  		// String name = session.getAttribute("LOGINUSER").toString();
//  		if (null == user) {
//  			return false;
//  		}
  		String strSendCotent = /*user8 +*/" 於 " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) + " 說: " + content;
  		if (strSendContentList.size() == 0) {
  			strSendContentList = new ArrayList<String>();
  		}
  		strSendContentList.add(strSendCotent);
  		return true;
  	}
    
    // 選擇服務員後加進配對表 有配對表controller直接跳轉會員中心
    public Boolean matching(String memberId, int servantId) {
    	int reservationId = matchDao.selectReservationId(memberId);
    	String idMapping = reservationId + "-" + servantId;
    	Integer hasMatching = matchDao.selectCountByMappingId(idMapping);
    	if(hasMatching==1) {
    		return true;
    	}    	
    	Matching mBean = new Matching();
    	mBean.setMappingId(idMapping);
    	mBean.setReservationId(reservationId);
    	mBean.setServiceId(servantId);
    	matchDao.insertMatchingForm(mBean);
    	return false;    	
    }
    
    // 預約者選擇配對清單服務員
    public List<String> selectServantName(String memberId) {
    	System.out.print(matchDao.selectReservationId(memberId));
        return matchDao.selectServantName(matchDao.selectReservationId(memberId));
    }
   
}
