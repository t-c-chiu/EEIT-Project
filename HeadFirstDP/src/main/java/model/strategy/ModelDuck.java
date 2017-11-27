package model.strategy;

public class ModelDuck extends Duck {

	public ModelDuck() {
		flyB = new FlyNoWay();
		quackB = new Quack();
	}

	@Override
	public void display() {
		System.out.println("ModelDuck");
	}

}
