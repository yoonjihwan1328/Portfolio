package com.lect.ex3.accessTest;

public class AccessTest {
//������
	private int privateMember;	// ���� Ŭ���� �������� ��밡��
	int defaultMember;			// ����Ʈ �������� : ���� ��Ű�������� ����
	protected int protectedMember;	// ���� ��Ű���� ��ӹ��� Ŭ�������� ����
	public int publicMember;		// �ܺο��� �ƹ���
//�޼ҵ�
	private void privateMethod() {
		System.out.println("private �޼ҵ�");
	}
	void defaultMethod() {
		System.out.println("default �޼ҵ�");
	}
	protected void protectedMethod() {
		System.out.println("protected �޼ҵ�");
	}
	public void publicMethod() {
		System.out.println("public �޼ҵ�");
	}// ���õ��� �Ű�����(�Ķ����)�� �䱸���� ������ return ���� ��ȯ���� �ʴ� ���õ��ε�.
}
