package com.lect.ex02_super;
// �������Լ��� �Ű������� ���� ��, �ϳ��� ��, �� ���ΰ� �� �������� �����ϴ� ��츦 ����
public class SuperIJ {
	private int i;	//protected int i;�� ChildŬ���������� �ڵ��� �޶��� ���� ����(������ �ǹ������� �� ������ �ʴµ�?0
	private int j;
	public SuperIJ() {
		System.out.println("�Ű������� ���� SuperIJ ������ �Լ�");
	}
	public SuperIJ(int i, int j ) {
		this.i = i; this.j = j;
		System.out.println("�Ű������� �ִ� SuperIJ ������ �Լ�");
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	public int getJ() {
		return j;
	}
	public void setJ(int j) {
		this.j = j;
	}

}
//MainŬ�������� ��ӹ��� �� 1) �Ű������� ���� �������Լ� or �Ű������� �ִ� �������Լ��� ---�� ���ΰ�?
//�ٵ� Main�� ������ �� ParentClass�� ChildClass���� �������Լ��� ȣ��ȴٴ� ���� ������ �ǹ̰� ����???