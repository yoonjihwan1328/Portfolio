package com.lect.ex12_final;

public final 
class Dog extends Animal {
	@Override
	public void running() {
		speed += 10;
		System.out.println("�������� ������ ���� �پ��. ����ӵ� : " + speed);
	}
	public void method() {
		System.out.println("method");
	}

}
