package com.lect.ex6_product;

public class Product {
	private int serialNo;	//��ü ������ȣ
	private String name;
	public static int count = 100;
	public Product(String name) {
		this.name = name;
		serialNo = ++count;
	}
	public void infoPrint() {
		System.out.printf("��ǰ�� : %s, �ø���ѹ� : %d, �������� count : %d\n",
									name, serialNo, count);
	}

}
