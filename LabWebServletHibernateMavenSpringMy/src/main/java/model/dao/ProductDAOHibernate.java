package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ProductBean;
import model.ProductDAO;

@Repository
public class ProductDAOHibernate implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public ProductBean select(int id) {
		return getSession().get(ProductBean.class, id);
	}

	@Override
	public List<ProductBean> select() {
		return getSession().createQuery("from ProductBean", ProductBean.class).getResultList();
	}

	@Override
	public ProductBean insert(ProductBean bean) {
		if (bean != null) {
			ProductBean temp = this.select(bean.getId());
			if (temp == null) {
				getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public ProductBean update(String name, double price, java.util.Date make, int expire, int id) {
		ProductBean bean = this.select(id);
		if (bean != null) {
			bean.setName(name);
			bean.setPrice(price);
			bean.setMake(make);
			bean.setExpire(expire);
		}
		return bean;
	}

	@Override
	public boolean delete(int id) {
		ProductBean bean = this.select(id);
		if (bean != null) {
			getSession().delete(bean);
			return true;
		}
		return false;
	}
}
