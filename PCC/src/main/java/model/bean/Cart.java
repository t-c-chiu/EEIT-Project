package model.bean;

public class Cart {
	private int price;
	private int quantity;
	private String productName;
	private int productId;
	private String pictureAscii;
	private int subtotal=quantity*price;
	


	@Override
	public String toString() {
		return "Cart [price=" + price + ", quantity=" + quantity + ", productName=" + productName + ", productId="
				+ productId + ", pictureAscii=" + pictureAscii + ", subtotal=" + subtotal + "]";
	}

	public String getPictureAscii() {
		return pictureAscii;
	}

	public void setPictureAscii(String pictureAscii) {
		this.pictureAscii = pictureAscii;
	}

	public int getSubtotal() {
		return quantity*price;
	}



	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
}
