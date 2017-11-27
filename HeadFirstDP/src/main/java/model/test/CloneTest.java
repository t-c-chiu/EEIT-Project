package model.test;

public class CloneTest implements Cloneable {

	private int field1 = 1;

	public CloneTest(int field1) {
		this.field1 = field1;
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	public String toString() {
		return "field1 = " + field1;
	}

}
