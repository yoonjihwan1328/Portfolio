package com.lect.ex01_parentChild;

public class ParentClass {
	String pStr = "부모클래스=Super클래스";
	public ParentClass() {	//생성자 함수인듯? 생성자 함수는 초기화하는 기능?
		System.out.println("부모 클래스 객체 부분 생성할 때 호출되는 생성자 함수");
	}
	public void getPapaName() {
		System.out.println("아빠이름 : 홍길동");
	}
	public void getMamiName() {
		System.out.println("엄마이름 : 김길순");
	}
	
}
