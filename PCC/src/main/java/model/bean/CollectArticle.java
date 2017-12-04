package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CollectArticle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int collectId;
	private int messageId;
	private String memberId;

	public int getCollectId() {
		return collectId;
	}

	public void setCollectId(int collectId) {
		this.collectId = collectId;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
