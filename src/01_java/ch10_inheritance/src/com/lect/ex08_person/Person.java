package com.lect.ex08_person;
// Person p = new Person()
// person p1 = new Person("ȫ�浿, "���ϴ�");
public class Person {
	private String name;
	private String character;
	public Person() {	// �Ű������� ���� ������
		System.out.println("�Ű����� ���� Person ������");
	}
	
	public Person(String name, String character) {	// �Ű������� �ִ� ������
		this.name = name; this.character = character;
		System.out.println("�Ű������� �ִ� Person ������");
	}
	public void intro() {
		System.out.println(name + "��(��) "+character);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
}
