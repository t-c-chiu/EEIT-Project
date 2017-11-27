package model.strategy;

public abstract class Duck {
	FlyBehavior flyB;
	QuackBehavior quackB;
	
	public Duck() {
	}

	public abstract void display();
	
	public void performFly() {
		flyB.fly();
	}
	
	public void performQuack(){
		quackB.quack();
	}
	
	public void swim() {
		System.out.println("All ducks float.");
	}

	public void setFlyB(FlyBehavior flyB) {
		this.flyB = flyB;
	}

	public void setQuackB(QuackBehavior quackB) {
		this.quackB = quackB;
	}
	
}
