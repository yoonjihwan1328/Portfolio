package com.lect.ex02_super;
//main함수에서 Child child = new Child(1,2);를 만들 예정임.
public class Child extends SuperIJ {	//C++에서는 다중상속이 가능함...
	private int total;
	public Child() {
		System.out.println("매개변수 없는 Child 생성자 함수");
	}
	public Child(int i, int j) {	//직전 패키지의 ChildClass에서는 매개변수가 없는 ---였음
		setI(i);
		setJ(j);
		System.out.println("매개변수가 있는 Child 생성자 함수");
//		this.i = i; SuperIJ의 int i;가 protected일 때
	}
	public void sum() {
		total = getI() + getJ();
		System.out.println("본 객체의 total값은 " + total);
	}
}
