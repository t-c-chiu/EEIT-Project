package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exchange {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer exchangeId;
	private Integer totalpoint;
	private String memberId;
	private String address;
	private String name;
	private String phone;
	private String email;
					
	@Override
	public String toString() {
		return "Exchange [exchangeId=" + exchangeId + ", totalpoint=" + totalpoint + ", memberId=" + memberId
				+ ", address=" + address + ", name=" + name + ", phone=" + phone + ", email=" + email + "]";
	}
	
	public Integer getExchangeId() {
		return exchangeId;
	}
	public void setExchangeId(Integer exchangeId) {
		this.exchangeId = exchangeId;
	}
	public Integer getTotalpoint() {
		return totalpoint;
	}
	public void setTotalpoint(Integer totalpoint) {
		this.totalpoint = totalpoint;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
