package com.lect.ex12_final;

public class Animal {
	protected int speed;	// ��ӹ����� �� �� ����, private�̸�(???) get�̿�
	public void running() {
		speed += 5;
		System.out.println("�ٰ� �־��. ����ӵ� : " + speed);
	}
	public final void stop() {	//�������̵� �Ұ�
		speed = 0;
		System.out.println("����");
	}

}
