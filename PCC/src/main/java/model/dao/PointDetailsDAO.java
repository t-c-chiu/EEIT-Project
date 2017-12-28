package model.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.PointDetails;

@Repository
public class PointDetailsDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// SELECT gettingDate,memberId,getWay,getPoint FROM PointDetails WHERE
	// memberId='Tester';
	public List<PointDetails> selectpoint(String memberId) {
		Query<PointDetails> query = getSession().createQuery("FROM PointDetails WHERE memberId=?", PointDetails.class);
		query.setParameter(0, memberId);
		return query.list();
	}
	

	public int insertPoint(PointDetails pointDetails) {
		int key=(int)getSession().save(pointDetails);
		return key;

	}

	// INSERT pointDetails
	// INSERT INTO PointDetails(gettingDate,memberId,getWay,getPoint)values('2017-12-25','Tester','聖誕節點活動',10);
	public PointDetails insertPointDetails(PointDetails pointDetails) {
		getSession().save(pointDetails);
		System.out.println("PointDetailsDAO pointDetails=" + pointDetails);
		return pointDetails;
	}

}
