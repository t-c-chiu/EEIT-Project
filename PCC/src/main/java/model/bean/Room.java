package model.bean;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Room {

	@Id
	private int roomId;
	private int price;
	private int status;
	private String roomType;
	private byte[] roomPhoto;
	private String roomImage;
	private String roomName;
	private String info;
	private String area;
	private String address;
	
	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", price=" + price + ", status=" + status + ", roomType=" + roomType
				+ ", roomPhoto=" + Arrays.toString(roomPhoto) + ", roomImage=" + roomImage + ", roomName=" + roomName
				+ ", info=" + info + ", area=" + area + ", address=" + address + "]";
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getRoomImage() {
		return roomImage;
	}

	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public byte[] getRoomPhoto() {
		return roomPhoto;
	}

	public void setRoomPhoto(byte[] roomPhoto) {
		this.roomPhoto = roomPhoto;
	}
}
