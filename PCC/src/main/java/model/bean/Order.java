package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Orders")
public class Order {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	private String memberId;
	private int totalPrice;
	private Date date;
	private int status;
	private String location;
	private double discount;
	private String recipient;
	private String recipientPhone;

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", memberId=" + memberId + ", totalPrice=" + totalPrice + ", date=" + date
				+ ", status=" + status + ", location=" + location + ", discount=" + discount + ", recipient="
				+ recipient + ", recipientPhone=" + recipientPhone + "]";
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@JsonFormat(pattern = "yyyy/MM/dd hh:mm", timezone = "GMT+8")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}
}