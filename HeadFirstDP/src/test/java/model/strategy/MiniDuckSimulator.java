package model.strategy;

import model.strategy.DuckCall;
import model.strategy.MuteQuack;
import model.strategy.Quack;
import model.strategy.Squeak;

public class MiniDuckSimulator {

	public static void main(String[] args) {
		// Duck mallard = new MallardDuck();
		// mallard.performFly();
		// mallard.performQuack();

		// Duck model = new ModelDuck();
		// model.performFly();
		// model.setFlyB(new FlyRocketPowered());
		// model.performFly();

		DuckCall duckCall = new DuckCall();
		duckCall.setQuackB(new Quack());
		duckCall.performQuack();
		duckCall.setQuackB(new MuteQuack());
		duckCall.performQuack();
		duckCall.setQuackB(new Squeak());
		duckCall.performQuack();
	}

}
