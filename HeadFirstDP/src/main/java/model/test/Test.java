package model.test;

public class Test {

	public static void main(String[] args) throws CloneNotSupportedException {
		CloneTest ct = new CloneTest(5);
		
		System.out.println(ct.hashCode());
		
		CloneTest ct2 =(CloneTest) ct.clone();
		System.out.println(ct2.hashCode());
	}
}
