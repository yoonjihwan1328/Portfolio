package com.lec.loop;

import java.util.Scanner;

public class Ex10_DoWhile {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num;
		do {
			System.out.print("�ݵ�� ¦���� �Է��ϼ��� : ");
			num = scanner.nextInt();	// ����ڷκ��� ���ڸ� �Է¹���
			
		}while(num%2 == 1 || num%2==-1);	//(num%2 != 0); �� ����
		System.out.println("�Է��Ͻ� ¦���� " + num);
		scanner.close();
	}

	
}
