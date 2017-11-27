package model.factory;

public class NYPizzaStore extends PizzaStore {

	public NYPizzaStore(SimplePizzaFactory factory) {
		super(factory);
		// TODO Auto-generated constructor stub
	}

	Pizza createPizza(String item) {
		if (item.equals("cheese")) {
			return new NYStyleCheesePizza();
		} else if (item.equals("veggie")) {
			return new NYStyleVeggiePizza();
		} else if (item.equals("clam")) {
			return new NYStyleClamPizza();
		} else if (item.equals("pepperoni")) {
			return new NYStylePepperoniPizza();
		} else return null;
	}
}
