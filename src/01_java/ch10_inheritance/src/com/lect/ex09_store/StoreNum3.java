package com.lect.ex09_store;
//���ǰ� 3ȣ�� : ����κ��� ��� �� ��ġ� 6,000 �δ�� 7,000 ����� 7,000 ���뱹 6,000
public class StoreNum3 extends HeadquaterStore {
	public StoreNum3(String name) {
		super(name);
	}
	@Override
	public void kimchi() {
		System.out.println("��ġ� 6,000��");
	}
	@Override
	public void bude() {
		System.out.println("�δ�� 7,000��");
	}
	@Override
	public void bibib() {
		System.out.println("����� 7,000��");
	}
	@Override
	public void sunde() {
		System.out.println("���뱹 6000��");
	}
}
