package com.lect.ex2_human;
// Man man = new Man();
public class Man {
	private int age;
	public Man() {	// public void Man()�� ���� �Է��ϸ� �������Լ��� �۵����� ����. �������Լ���� Ŭ������� ������! return type�� ������!
		System.out.println("�����ڰ� ������ �Լ��� ������ ������ �����Ϸ��� ����Ʈ �����ڸ� ������");
	}
	public Man(int age) {
		System.out.println("�Ű�����(�Ķ����)�� �ִ� ������ �Լ� ȣ��");
		this.age = age;	// ������ �ʱ�ȭ
	}
}
