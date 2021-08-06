package com.lect.ex08_person;

public class Baby extends Person{
	public Baby() {
		System.out.println("매개변수 없는 Baby 생성자");
	}
	public Baby(String name, String character) {
		super(name, character);	// 매개변수 있는 부모단의 생성자. 
		// super()는 항상 첫 명령어로 호출.
		System.out.println("매개변수 있는 Baby 생성자");
	}
	public void cry() {
		System.out.println("응애 응애");
	}
	public void intro() {
		System.out.println(getName() + "은(는) 아기라서 엄마가 대신 소개할게요");
		super.intro();
	}

}// super(매개변수)를 확인하기 위한 연습
