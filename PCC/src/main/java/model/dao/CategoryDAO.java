package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.CategoryType;

@Repository
public class CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	//進入商城頁面，進入資料庫搜尋商品頁面該有的資料(欄位)
	public List<CategoryType> selectTypeOfCategory(){
		
		 System.out.println("ininin");
		 List<CategoryType> categoryType= getSession().createQuery("From CategoryType", CategoryType.class).list();
		 System.out.println("categoryType"+categoryType);
		 return categoryType;
	
	}
}
