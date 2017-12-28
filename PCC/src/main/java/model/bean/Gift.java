package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Gift {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer giftId;	
	private String giftName;
	private Integer point;
	private String info;
	private Integer stock;
	private String category;
		
	@Override
	public String toString() {
		return "Gift [giftId=" + giftId + ", giftName=" + giftName + ", point=" + point + ", info=" + info + ", stock="
				+ stock + ", category=" + category + "]";
	}
	public Integer getGiftId() {
		return giftId;
	}
	public void setGiftId(Integer giftId) {
		this.giftId = giftId;
	}
	public String getGiftName() {
		return giftName;
	}
	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	


}
