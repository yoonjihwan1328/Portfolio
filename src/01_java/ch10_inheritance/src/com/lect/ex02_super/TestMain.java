package com.lect.ex02_super;

public class TestMain {
	public static void main(String[] args) {
		Child child = new Child(1,2);
		System.out.println("i값 : " + child.getI());
		System.out.println("j값 : " + child.getJ());
		child.setI(100);
		child.setJ(200);
		child.sum();
	}

}
//	SuperIJ에서 매개변수가 없는 생성자를 삭제하면 TestMain을 실행할 때 오류가 발생
//	매개변수가 없는 생성자를 반드시 만들어 놓아야 함!!!
