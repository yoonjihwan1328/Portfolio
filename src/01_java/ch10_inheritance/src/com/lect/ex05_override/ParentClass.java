package com.lect.ex05_override;
//	�������̵�(�Լ��� ������ : ��ӹ޴� Ŭ������ �ٽ� ������)
//	�����ε�(�Լ� �ߺ����� : �Ű������� Ÿ���̳� ������ �޸��Ͽ� ���� �̸��� �Լ��� �ߺ��ؼ� ����)
public class ParentClass {
	public ParentClass() {
		System.out.println("Parent �Ű����� ���� ������ �Լ�");
	}
	public ParentClass(int i) {
		System.out.println("Parent�Ű����� �ִ� ������ �Լ�");
	}	// �����ε�
	
	public void method1() {
		System.out.println("Parent�� method1()");
	}
	public void method2() {
		System.out.println("Parent�� method2()");
	}
}
