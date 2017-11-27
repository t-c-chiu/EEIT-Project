package model.decorator;

public class Soy extends CondimentDecorator {
	Beverage beverage;

	public Soy(Beverage beverage) {
		this.beverage = beverage;
	}

	@Override
	public String getDescription() {
		return beverage.getDescription() + ", Soy";
	}

	@Override
	public double cost() {
		double cost = beverage.cost();

		switch (beverage.getSize()) {
		case Beverage.TALL:
			cost += .10;
			break;
		case Beverage.GRANDE:
			cost += .15;
			break;
		case Beverage.VENTI:
			cost += .20;
		}
		return cost;
	}

}
