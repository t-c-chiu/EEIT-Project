package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExchangeDetails {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer exchangeDetailsId;	
	private String giftId;
	private String giftName;
	private Integer point;
	private Integer number;
			
	@Override
	public String toString() {
		return "ExchangeDetails [exchangeDetailsId=" + exchangeDetailsId + ", giftId=" + giftId + ", giftName="
				+ giftName + ", point=" + point + ", number=" + number + "]";
	}
	
	public Integer getExchangeDetailsId() {
		return exchangeDetailsId;
	}
	public void setExchangeDetailsId(Integer exchangeDetailsId) {
		this.exchangeDetailsId = exchangeDetailsId;
	}
	public String getGiftId() {
		return giftId;
	}
	public void setGiftId(String giftId) {
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
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}

	
}
