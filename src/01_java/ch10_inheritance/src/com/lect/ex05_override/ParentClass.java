package com.lect.ex05_override;
//	오버라이딩(함수를 재정의 : 상속받는 클래스가 다시 재정의)
//	오버로딩(함수 중복정의 : 매개변수의 타입이나 갯수를 달리하여 같은 이름의 함수를 중복해서 정의)
public class ParentClass {
	public ParentClass() {
		System.out.println("Parent 매개변수 없는 생성자 함수");
	}
	public ParentClass(int i) {
		System.out.println("Parent매개변수 있는 생성자 함수");
	}	// 오버로딩
	
	public void method1() {
		System.out.println("Parent의 method1()");
	}
	public void method2() {
		System.out.println("Parent의 method2()");
	}
}
