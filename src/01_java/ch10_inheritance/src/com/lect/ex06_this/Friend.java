package com.lect.ex06_this;
// this() : �� Ŭ������ ������ �Լ�
// this. : �� ��ü��
public class Friend {
	private String name;
	private String tel;
	public Friend() {
		System.out.println("�Ű����� ���� ������ �Լ�");
	}
	public Friend(String name) {
		this();
		this.name = name;
		System.out.print("�Ű����� �ϳ�¥�� ������ �Լ�");
	}
	
	public Friend(String name, String tel) {
		this();	//Friend(name)ȣ��
		this.name = name;
		this.tel = tel;
		System.out.println("�Ű����� �ִ� ������ �Լ� ��ȸ");
	}
}
