package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.FavoriteProduct;

@Repository
public class FavoriteProudctDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public int insert(FavoriteProduct favoriteProudct) {

		return (int) getSession().save(favoriteProudct);
	}

	// DELETE FROM FavoriteProduct WHERE memberId='Tester' and productId='15'
	public boolean delete(String memberId, int productId) {

		if (memberId != null && productId != 0) {
			List<FavoriteProduct> select = selectByMemberIdAndProductId(memberId, productId);
			if (select != null) {
				for (FavoriteProduct fp : select) {
					getSession().delete(fp);
					
				}
			} else {
				return false;
			}
			// Query<FavoriteProduct> query = getSession().createQuery("DELETE FROM
			// FavoriteProduct WHERE memberId=:memberId and
			// productId=:prodcutId",FavoriteProduct.class);
			// query.setParameter("memberId", memberId);
			// query.setParameter("prodcutId", productId);
			//
			// if(query.list().isEmpty()) {
			//
			// return false;
			// }
			// System.out.println("4"+memberId+productId);
			return true;
		}
		return false;
	}

	public List<FavoriteProduct> selectAll(String memberId) {

		Query<FavoriteProduct> listFP = getSession().createQuery("from FavoriteProduct where memberId=?",
				FavoriteProduct.class);

		listFP.setParameter(0, memberId);

		return listFP.list();
	}

	// from FavoriteProduct where memberId='Tester' and productId=15;
	public List<FavoriteProduct> selectByMemberIdAndProductId(String memberId, int productId) {
		Query<FavoriteProduct> query = getSession().createQuery(
				"from FavoriteProduct where MemberId=:memberId and ProductId=:productId", FavoriteProduct.class);
		query.setParameter("memberId", memberId);
		query.setParameter("productId", productId);
		return query.list();
	}

}
