package com.lect.ex07_super_dot;
//	super �θ�Ŭ������
public class ChildClass extends ParentClass_____ {
	private String cStr = "�ڽ�Ŭ����";
	public ChildClass() {
		System.out.println("�ڽĻ�����");
	}
	public void getMamiName() {
		System.out.println("�̻� ���� �̻�");
		super.getMamiName();
	}
}
