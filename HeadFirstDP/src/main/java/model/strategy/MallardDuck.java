package model.strategy;

public class MallardDuck extends Duck {
	public MallardDuck() {
		quackB = new Quack();
		flyB = new FlyWithWings();
	}

	public void display() {
		System.out.println("MallarDuck");
	}
}
