package com.lec.condition;

import java.util.Scanner;

public class Practice01_if {
	public static void main(String[] args) {
		Scanner scanner1 = new Scanner(System.in);
		System.out.println("ù ��° ���� �Է��ϼ���");
		int value1 = scanner1.nextInt();
//		
//		int result = value1;
//		if (value1 >= 0) {
//			result = value1;
//		} else {
//			result = -value1;
//		}
//		System.out.println(result);
		if (value1 >= 0) {
			System.out.printf("�Է��Ͻ� ���� ���방 : %d\n", value1);
		} else {
			System.out.printf("�Է��Ͻ� ���� ���밪 : %d\n", -value1);
		}
		scanner1.close();
	}

}
