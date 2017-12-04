package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SystemMessage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int systemMessageId;
	private String memberId;
	private Date date;
	private String contents;
	private int status;
	
	public int getSystemMessageId() {
		return systemMessageId;
	}
	public void setSystemMessageId(int systemMessageId) {
		this.systemMessageId = systemMessageId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
