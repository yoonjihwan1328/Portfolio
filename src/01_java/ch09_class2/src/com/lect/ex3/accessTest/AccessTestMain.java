package com.lect.ex3.accessTest;
//AccessTest Ŭ�������� ���� �޼������ Ȱ���� �ܺο��� �������� Ȯ��.
public class AccessTestMain {
	public static void main(String[] args) {
		AccessTest obj = new AccessTest(); // �տ��� �츮�� ...�� ���� ���߾��µ�? -> �����Ϸ��� (){}�� ������ ���� ��
//		System.out.println(obj.privateMember);	
		System.out.println(obj.defaultMember);
		System.out.println(obj.protectedMember);
		System.out.println(obj.publicMember);
		//private�� ��쿡�� ���� ��Ű�� �� �ٸ� Ŭ�������� ������ �ȵȴ�.
	
//		obj.privateMethod();
		obj.defaultMethod();
		obj.protectedMethod();
		obj.publicMethod();
	}

}
