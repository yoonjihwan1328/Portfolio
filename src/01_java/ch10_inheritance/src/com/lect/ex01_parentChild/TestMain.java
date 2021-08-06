package com.lect.ex01_parentChild;

public class TestMain {
	public static void main(String[] args) {
		ChildClass child;	//공간만 마련된거지 객체가 만들어진 상태는 아님.
		child = new ChildClass();	// 객체 변수가 생성됨
//ChildClass가 아닌 ParentClass의 pStr에 접근이 가능한지 -> OK
		System.out.println(child.cStr);	
		System.out.println(child.pStr);
		child.getPapaName();
		child.getMamiName();
	}
}
//부모 클래스의 생성자 함수가 먼저 호출되고 그 다음 자식 클래스의 생성자 함수가 호출됨.