package model.bean;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PointDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pointId;
	private Date gettingDate;
	private String getWay;
	private int getPoint;
	@Override
	public String toString() {
		return "PointDetails [pointId=" + pointId + ", gettingDate=" + gettingDate + ", getWay=" + getWay
				+ ", getPoint=" + getPoint + "]";
	}
	public int getPointId() {
		return pointId;
	}
	public void setPointId(int pointId) {
		this.pointId = pointId;
	}
	public Date getGettingDate() {
		return gettingDate;
	}
	public void setGettingDate(Date gettingDate) {
		this.gettingDate = gettingDate;
	}
	public String getGetWay() {
		return getWay;
	}
	public void setGetWay(String getWay) {
		this.getWay = getWay;
	}
	public int getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}
	
}
