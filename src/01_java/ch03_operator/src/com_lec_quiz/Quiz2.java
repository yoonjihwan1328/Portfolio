package com_lec_quiz;

import java.util.Scanner;

public class Quiz2 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� : ");
		int temp = input.nextInt();
		String result = (temp % 2 ==0) ? "¦���Դϴ�" : "Ȧ���Դϴ�" ;
		System.out.println("�Է��Ͻ� ���� " + result) ;
		input.close();
		
	}

}
