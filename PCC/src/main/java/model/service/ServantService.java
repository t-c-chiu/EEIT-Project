package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.Servant;
import model.dao.ServantDAO;

@Service
@Transactional
public class ServantService {
    @Autowired
    private ServantDAO servantDao;
  
    
    public List<List> showServantList() {
    	  	
    	List servantList2 = new ArrayList();
    	List<Object[]> data = servantDao.selectServantList();
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
	
    
    
    
    
    
    
    
    
    
    
    
    
    
   
}
