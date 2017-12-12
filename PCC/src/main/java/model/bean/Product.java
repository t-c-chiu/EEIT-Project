package model.bean;

import java.sql.Date;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private int stock;
	private int price;
	private String productName;
	private String category;
	private byte[] picture;
	private int status;
//	private Date date;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public byte[] getPicture() {
		return picture;
	}
	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
//	public Date getDate() {
//		return date;
//	}
//	public void setDate(Date date) {
//		this.date = date;
//	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", stock=" + stock + ", price=" + price + ", productName="
				+ productName + ", category=" + category + ", picture=" + Arrays.toString(picture) + ", status="
				+ status + "]";
	}

	

}
