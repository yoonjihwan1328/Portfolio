package com.lect.ex08_person;

public class Baby extends Person{
	public Baby() {
		System.out.println("�Ű����� ���� Baby ������");
	}
	public Baby(String name, String character) {
		super(name, character);	// �Ű����� �ִ� �θ���� ������. 
		// super()�� �׻� ù ��ɾ�� ȣ��.
		System.out.println("�Ű����� �ִ� Baby ������");
	}
	public void cry() {
		System.out.println("���� ����");
	}
	public void intro() {
		System.out.println(getName() + "��(��) �Ʊ�� ������ ��� �Ұ��ҰԿ�");
		super.intro();
	}

}// super(�Ű�����)�� Ȯ���ϱ� ���� ����
