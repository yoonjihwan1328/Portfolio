package com.lect.ex01_parentChild;

public class TestMain {
	public static void main(String[] args) {
		ChildClass child;	//������ ���õȰ��� ��ü�� ������� ���´� �ƴ�.
		child = new ChildClass();	// ��ü ������ ������
//ChildClass�� �ƴ� ParentClass�� pStr�� ������ �������� -> OK
		System.out.println(child.cStr);	
		System.out.println(child.pStr);
		child.getPapaName();
		child.getMamiName();
	}
}
//�θ� Ŭ������ ������ �Լ��� ���� ȣ��ǰ� �� ���� �ڽ� Ŭ������ ������ �Լ��� ȣ���.