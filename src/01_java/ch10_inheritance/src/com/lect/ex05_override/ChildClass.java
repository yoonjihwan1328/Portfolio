package com.lect.ex05_override;

public class ChildClass extends ParentClass{
	public ChildClass() {//������ �Լ��� �����ε�(�Լ��� �ߺ�����)
		System.out.println("Child�� �Ű����� ���� ������");
	}
	public ChildClass(int i) {
		System.out.println("Child�� �Ű����� �ִ� ������");
	}
//�������̵�(�Լ��� ������)
	@Override //������̼�
	public void method1() {
		System.out.println("Child�� method1()");
	}
	public void method3() {
		System.out.println("Child�� method3()");
	}
}
