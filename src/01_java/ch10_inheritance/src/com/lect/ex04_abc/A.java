package com.lect.ex04_abc;

public class A extends S{
	public A() {
		System.out.println("A형 객체 생성");
		s = 1;	//S로부터 상속받았기 때문에 데이터타입을 선언하지 않아도 되는듯?
	}

}
