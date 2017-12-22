package model.bean;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SystemMessage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer systemMessageId;
	private String memberId;
	private Timestamp date = new Timestamp(new java.util.Date().getTime());
	private String contents;
	private String title;
	// 0未讀 1已讀
	private Integer status;

	public Integer getSystemMessageId() {
		return systemMessageId;
	}

	public void setSystemMessageId(Integer systemMessageId) {
		this.systemMessageId = systemMessageId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "SystemMessage [systemMessageId=" + systemMessageId + ", memberId=" + memberId + ", date=" + date
				+ ", contents=" + contents + ", title=" + title + ", status=" + status + "]";
	}
}
