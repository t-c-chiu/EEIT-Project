package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class Matching {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer matchingId;
	private Integer serviceId;
	private Integer reservationId;
	//0剛配 1審核成功 2審核後拒絕 3該申請人已有其他配對審核通過
	private Integer status;
	private Date date;

	public Integer getMatchingId() {
		return matchingId;
	}

	public void setMatchingId(Integer matchingId) {
		this.matchingId = matchingId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getReservationId() {
		return reservationId;
	}

	public void setReservationId(Integer reservationId) {
		this.reservationId = reservationId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Matching [matchingId=" + matchingId + ", serviceId=" + serviceId + ", reservationId=" + reservationId
				+ ", status=" + status + ", date=" + date + "]";
	}

}
