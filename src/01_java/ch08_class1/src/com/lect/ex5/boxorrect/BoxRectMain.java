package com.lect.ex5.boxorrect;

public class BoxRectMain {
	public static void main(String[] args) {
		BoxOrRect box = new BoxOrRect(5, 6, 10); // new�� �ڿ��ִ�...
		BoxOrRect rect = new BoxOrRect(5, 10);
		box.calV();
		rect.calV();
		System.out.println("box�� ���� : " + box.getVolume());
		System.out.println("rect�� ���� : " + rect.getVolume());
	}


}
