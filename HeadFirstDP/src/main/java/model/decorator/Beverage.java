package model.decorator;

public abstract class Beverage {
	public final static int TALL = 1;
	public final static int GRANDE = 2;
	public final static int VENTI = 3;
	String description = "Unknown Beverage";
	int size = 0;

	public String getDescription() {
		return description;
	}

	public abstract double cost();

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
}
