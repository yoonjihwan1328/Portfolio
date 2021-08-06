package com.lect.ex06_this;
// this() : 현 클래스의 생성자 함수
// this. : 내 객체의
public class Friend {
	private String name;
	private String tel;
	public Friend() {
		System.out.println("매개변수 없는 생성자 함수");
	}
	public Friend(String name) {
		this();
		this.name = name;
		System.out.print("매개변수 하나짜리 생성자 함수");
	}
	
	public Friend(String name, String tel) {
		this();	//Friend(name)호출
		this.name = name;
		this.tel = tel;
		System.out.println("매개변수 있는 생성자 함수 조회");
	}
}
