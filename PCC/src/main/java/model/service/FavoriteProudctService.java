package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.FavoriteProduct;
import model.bean.Product;
import model.dao.FavoriteProudctDAO;
import model.dao.ProductDAO;

@Service
@Transactional
public class FavoriteProudctService {
	@Autowired
	private FavoriteProudctDAO favoriteProudctDAO;
	@Autowired
	private ProductDAO productDAO;

	
	//先去檢查有沒有重複，再來決定要不要insert
	public int insertFP(FavoriteProduct favoriteProudct) {
		if (favoriteProudct != null) {
			String memberId=favoriteProudct.getMemberId();
			int productId=favoriteProudct.getProductId();
			List<FavoriteProduct> fp=favoriteProudctDAO.selectByMemberIdAndProductId(memberId, productId);
			if(fp.isEmpty() || fp==null) {
				return favoriteProudctDAO.insert(favoriteProudct);
		
			}else {
				
				return -1;
			}
			
		}
		return 0;
	}
	
	//用memberId 和 productId 去刪除
	public boolean deleteFP(String memberId, int productId) {
		if (memberId!= null && productId !=0) {
			return favoriteProudctDAO.delete(memberId,productId);
		}
		return false;
	}
	
	
	//搜尋出一堆prodcutID後，再利用ID去商品區內搜尋。
	public List<Product> selectFP(String memberId) {

		List<FavoriteProduct> listFP=favoriteProudctDAO.selectAll(memberId);
		List<Product> list=new ArrayList<Product>();
		
		for(FavoriteProduct fp:listFP) {
			int productId=fp.getProductId();
			Product product=productDAO.selectId(productId);
			list.add(product);
		}

		return list;

	}

}
