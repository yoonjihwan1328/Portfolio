package com.lect.ex02_super;

public class TestMain {
	public static void main(String[] args) {
		Child child = new Child(1,2);
		System.out.println("i�� : " + child.getI());
		System.out.println("j�� : " + child.getJ());
		child.setI(100);
		child.setJ(200);
		child.sum();
	}

}
//	SuperIJ���� �Ű������� ���� �����ڸ� �����ϸ� TestMain�� ������ �� ������ �߻�
//	�Ű������� ���� �����ڸ� �ݵ�� ����� ���ƾ� ��!!!
