package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class FavoriteProduct {
			 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int favoriteProductId;
	private String memberId;
	private int productId;


	@Override
	public String toString() {
		return "FavoriteProudct [favoriteProductId=" + favoriteProductId + ", memberId=" + memberId + ", productId="
				+ productId + "]";
	}
	public int getFavoriteProductId() {
		return favoriteProductId;
	}
	public void setFavoriteProductId(int favoriteProductId) {
		this.favoriteProductId = favoriteProductId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}

}
