package com_lec_quiz;

import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� : ");
		int temp = scanner.nextInt() ; // Ű����κ��� �Է¹��� ������ ��ȯ�޴� �Լ�
		String result = (temp >= 65) ? "��ο��" : "�Ϲ�" ;
		System.out.println(result) ;
		scanner.close();
	}

}
