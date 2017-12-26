package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class Clazz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer classId;
	private Integer numberOfStudents;
	private Integer price;
	//0還沒到達開課人數  1到達開課人數
	private Integer status;
	private Integer currentStudents;
	private String courseName;
	private String location;
	private String category;
	private String introduction;
	private Date startDate;
	private Date endDate;

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getNumberOfStudents() {
		return numberOfStudents;
	}

	public void setNumberOfStudents(Integer numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm", timezone = "GMT+8")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getCurrentStudents() {
		return currentStudents;
	}

	public void setCurrentStudents(Integer currentStudents) {
		this.currentStudents = currentStudents;
	}

	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Override
	public String toString() {
		return "Clazz [classId=" + classId + ", numberOfStudents=" + numberOfStudents + ", price=" + price + ", status="
				+ status + ", currentStudents=" + currentStudents + ", courseName=" + courseName + ", location="
				+ location + ", category=" + category + ", introduction=" + introduction + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}

}
