package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.PointDetails;
import model.dao.PointDetailsDAO;

@Service
@Transactional
public class PointDetailsService {
	@Autowired
	private PointDetailsDAO pointDetailsDAO;
	
	public List<PointDetails> select(String memberId) {
		if(memberId!=null) {
			List<PointDetails> details = pointDetailsDAO.selectpoint(memberId);
			return details;
		}
		return null;
	}

	
	public int insertPointDetail(PointDetails pointDetails) {
		if(pointDetailsDAO!=null) {
			int key=pointDetailsDAO.insertPointDetail(pointDetails);
			return key;
		}
		return 0;
	}
}
