package com.lec.condition;

import java.util.Scanner;

public class Ex02_if {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù ��° ������ �Է��ϼ��� ->");
		int num1 = sc.nextInt() ;
		System.out.print("�� ��° ������ �Է��ϼ��� ->");
		int num2 = sc.nextInt();
		if(num1 > num2) {
			System.out.printf("ù ��° ���� %d��ŭ �� Ů�ϴ�.",  num1-num2);
		} else if(num2 > num1) {
			System.out.printf("�� ��° ���� %d��ŭ �� Ů�ϴ�.", num2-num1);
		} else {
			System.out.println("ù ��°���� �� ��° ���� �����ϴ�");
		}
		sc.close();
	}

}
