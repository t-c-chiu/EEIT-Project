package model.observer;

public class Test {

	public static void main(String[] args) {
		NoticeU nu = new NoticeU();
		NoticeMe2 nm2 = new NoticeMe2(nu);
		NoticeMe1 nm1 = new NoticeMe1(nu);
		nu.setData("xxx", 999);
	} 

}
