package model.observer;

import java.util.Observable;

import org.springframework.stereotype.Component;

@Component
public class NoticeU extends Observable {

	String name;
	int age;

	public void notice() {
		setChanged();
		notifyObservers();
	}

	public void setData(String name, int age) {
		this.name = name;
		this.age = age;
		notice();
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}
}
