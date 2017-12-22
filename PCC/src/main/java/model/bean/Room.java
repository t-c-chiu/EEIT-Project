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
	

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", price=" + price + ", status=" + status + ", roomType=" + roomType
				+ ", roomPhoto=" + Arrays.toString(roomPhoto) + ", roomImage=" + roomImage + "]";
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
