package com.lect.ex02_super;
//main�Լ����� Child child = new Child(1,2);�� ���� ������.
public class Child extends SuperIJ {	//C++������ ���߻���� ������...
	private int total;
	public Child() {
		System.out.println("�Ű����� ���� Child ������ �Լ�");
	}
	public Child(int i, int j) {	//���� ��Ű���� ChildClass������ �Ű������� ���� ---����
		setI(i);
		setJ(j);
		System.out.println("�Ű������� �ִ� Child ������ �Լ�");
//		this.i = i; SuperIJ�� int i;�� protected�� ��
	}
	public void sum() {
		total = getI() + getJ();
		System.out.println("�� ��ü�� total���� " + total);
	}
}
