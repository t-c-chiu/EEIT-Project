package model.observer;

import java.util.Observable;
import java.util.Observer;

public class NoticeMe2 implements Observer {

	Observable ob;
	String name;
	int age;

	public NoticeMe2(Observable ob) {
		this.ob = ob;
		ob.addObserver(this);
	}

	@Override
	public void update(Observable o, Object arg) {
		if (o instanceof NoticeU) {
			NoticeU nu = (NoticeU) o;
			this.name = nu.getName();
			this.age = nu.getAge();
			System.out.println("NM2:\nname=" + name + "\nage=" + age);
		}
	}

}
