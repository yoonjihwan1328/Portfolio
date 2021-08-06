package com.lect.ex2_human;
// Man man = new Man();
public class Man {
	private int age;
	public Man() {	// public void Man()과 같이 입력하면 생성자함수로 작동하지 않음. 생성자함수명는 클래스명과 같을것! return type이 없을것!
		System.out.println("개발자가 생성자 함수를 만들지 않으면 컴파일러가 디폴트 생성자를 생섬함");
	}
	public Man(int age) {
		System.out.println("매개변수(파라미터)가 있는 생성자 함수 호출");
		this.age = age;	// 데이터 초기화
	}
}
