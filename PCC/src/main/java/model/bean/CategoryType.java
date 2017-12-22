package model.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CategoryType {
	
	@Id
	private String categoryName;
	private int sumCategory;
	
	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getSumCategory() {
		return sumCategory;
	}
	public void setCategorySum(int sumCategory) {
		this.sumCategory = sumCategory;
	}
	@Override
	public String toString() {
		return "CategoryType [categoryName=" + categoryName + ", sumCategory=" + sumCategory + "]";
	}

}
