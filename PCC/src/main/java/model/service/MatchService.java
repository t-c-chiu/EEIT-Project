package model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    
    public List<String> test(int customerID, int ServiceId, String message) {
    	List<String> result = strSendContentMap.get(customerID + "-" + ServiceId);
    	
    	if(result == null) {
    		strSendContentMap.put(customerID + "-" + ServiceId, new ArrayList<String>());
    		strSendContentMap.get(customerID + "-" + ServiceId).add(message);
    	} else {
    		result.add(message);
    	}
    	return new ArrayList<String>();
    }
    
    // get ServantList
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
	
    
    // get chat content
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

 	
 	// send message
 	public Boolean SendContent(String content, HttpSession session) {
// 		String user = (String) session.getAttribute("member");
 //
// 		// String name = session.getAttribute("LOGINUSER").toString();
// 		if (null == user) {
// 			return false;
// 		}
 		String strSendCotent = /*user8 +*/" 於 " + new java.util.Date(System.currentTimeMillis()) + " 說: " + content;
 		if (strSendContentList.size() == 0) {
 			strSendContentList = new ArrayList<String>();
 		}
 		strSendContentList.add(strSendCotent);
 		return true;
 	}

    // determine complete reservation form or not
    public Boolean CompleteReservationForm(String memberId) {
    	Reservation reservation = matchDao.selectReservation(memberId);
    	System.out.print(reservation);
    	if(reservation==null) {
    		return false;
    	}
    	return true;
    }
    
    // insert new reservationForm
    public Boolean insertReservationForm(Reservation reservation) {
    	
    	return matchDao.insertReservationForm(reservation);
    }
    
    
    
    
    
    
    
   
}
