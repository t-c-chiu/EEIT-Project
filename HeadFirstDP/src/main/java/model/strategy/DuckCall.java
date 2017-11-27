package model.strategy;

public class DuckCall {
	QuackBehavior quackB;

	public void setQuackB(QuackBehavior quackB) {
		this.quackB = quackB;
	}

	public void performQuack() {
		quackB.quack();
	}

}
