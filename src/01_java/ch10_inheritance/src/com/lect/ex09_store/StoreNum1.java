package com.lect.ex09_store;
// ���ð� 1ȣ�� : ����κ��� ��� -> �δ�� 5,000, ���뱹 ���������� �������̵� �� ��.
public class StoreNum1 extends HeadquaterStore {
//	�����ڸ��� ������ �߻��� ���� : HeadquaterStore�� �Ű����� ���� �����ڰ� ���� ����
	public StoreNum1(String name) {
		super(name);
	}
	@Override
	public void bude() {
		System.out.println("�δ�� 5,000��");
	}
	@Override
	public void sunde() {
		System.out.println("���뱹 ��������");
	}
}
