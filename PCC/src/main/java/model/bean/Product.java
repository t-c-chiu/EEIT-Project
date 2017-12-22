package model.bean;

import java.sql.Clob;

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
	private String  pictureAscii;
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
	public String getPictureAscii() {
		System.out.println("picture "+pictureAscii);
		return pictureAscii;
	}
	public void setPictureAscii(String pictureascii) {
		this.pictureAscii = pictureascii;
		System.out.println("picture "+pictureascii);
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
				+ productName + ", category=" + category + ", pictureAscii=" + pictureAscii + ", status="
				+ status + "]";
	}


	

}
