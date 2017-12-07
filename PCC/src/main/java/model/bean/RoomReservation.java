package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RoomReservation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roomReserverId;
	private int roomId;
	private int totalPrice;
	private String memberId;
	private Date beginDate;
	private Date endDate;

	public int getRoomReserverId() {
		return roomReserverId;
	}

	public void setRoomReserverId(int roomReserverId) {
		this.roomReserverId = roomReserverId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "RoomReservation [roomReserverId=" + roomReserverId + ", roomId=" + roomId + ", totalPrice=" + totalPrice
				+ ", memberId=" + memberId + ", beginDate=" + beginDate + ", endDate=" + endDate + "]";
	}
}
