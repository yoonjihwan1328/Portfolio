package com.lect.ex10_practice;

public class Person {
	private String id; String name;
	public Person() {
		System.out.println("�Ű������� ���� ������");
	}
	public Person(String id, String name) {
		this.name = name;
		this.id = id;
		System.out.println("�Ű������� �ִ� ������");
	}
	public String infoString() {
		return "(ID)"+id+"\t(�̸�):"+name;
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
