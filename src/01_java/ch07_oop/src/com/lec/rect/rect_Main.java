package com.lec.rect;

public class rect_Main {
	public static void main(String[] args) {
		Rect r1 = new Rect();
		Rect r2 = new Rect();
//Ŭ���� �ϳ��� ��ü �� ���� ���Ե� ����!!!
		System.out.println(r1.area());
		//System.out.println(r1.width); width�� height�� ȣ���� �Ұ����Ѱ�? private�̾ �׷���?
		//���� ���� ���� setting
		System.out.printf("r1�� ������ : %d %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2�� ������ : %d %d\n", r2.getWidth(), r2.getHeight());	// private���� ȣ���� ���� ���Ͱ� �ʿ��� ��? getter�� ������ �����ΰ�?
		
		r1.setWidth(195); r1.setHeight(425);
		System.out.print("���� ��\n");
		System.out.printf("r1�� ������ : %d %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2�� ������ : %d %d\n", r2.getWidth(), r2.getHeight());
		
		System.out.println(r1.area());
		System.out.println(r2.area());
	}


}
