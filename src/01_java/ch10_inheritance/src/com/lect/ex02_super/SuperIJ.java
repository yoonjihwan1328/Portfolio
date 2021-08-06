package com.lect.ex02_super;
// 생성자함수가 매개변수가 없는 것, 하나인 것, 두 개인것 등 여러개가 존재하는 경우를 검토
public class SuperIJ {
	private int i;	//protected int i;로 Child클래스에서의 코딩이 달라질 수는 있음(하지만 실무적으로 잘 쓰이지 않는듯?0
	private int j;
	public SuperIJ() {
		System.out.println("매개변수가 없는 SuperIJ 생성자 함수");
	}
	public SuperIJ(int i, int j ) {
		this.i = i; this.j = j;
		System.out.println("매개변수가 있는 SuperIJ 생성자 함수");
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	public int getJ() {
		return j;
	}
	public void setJ(int j) {
		this.j = j;
	}

}
//Main클래스에서 상속받을 때 1) 매개변수가 없는 생성자함수 or 매개변수가 있는 생성자함수가 ---될 것인가?
//근데 Main을 실행할 때 ParentClass나 ChildClass에서 생성자함수가 호출된다는 것이 가지는 의미가 뭐임???