package com.lect.ex5.momChild;

public class ChildTestMain {
	public static void main(String[] args) {
		Child child1 = new Child("ù°�ʸ���");
		Child child2 = new Child("��°�ʸ���");
		Child child3 = new Child("��°�ʸ���");
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		System.out.println("ù° ���� ���� : " + Child.momPouch.money);
		System.out.println("ù° ���� ���� : " + child1.momPouch.money);
		System.out.println("ù° ���� ���� : " + child2.momPouch.money);
		System.out.println("ù° ���� ���� : " + child3.momPouch.money);
	}
// ������ ���� ù �θ��� 1000���� �������� �� ��°���� ������ �� ������� �ߴµ�,
// momPouch�� ���� ���������ν�(???)... ��� 1000���� �������� 1000���� ���´�.
// momPouch�� �����Ǳ� ����ϴµ� �� �� ����ϴ� �͵� static!!!
	//����� ���� �ȵ� ���� Child Ŭ������ momPouch�� static���� �������� �ʾ��� ��.

}
