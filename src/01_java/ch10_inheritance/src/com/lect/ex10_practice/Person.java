package com.lect.ex10_practice;

public class Person {
	private String id; String name;
	public Person() {
		System.out.println("매개변수가 없는 생성자");
	}
	public Person(String id, String name) {
		this.name = name;
		this.id = id;
		System.out.println("매개변수가 있는 생성자");
	}
	public String infoString() {
		return "(ID)"+id+"\t(이름):"+name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
