package com_lec_quiz;

import java.util.Scanner;

public class Quiz4 {
	public static void main(String[] args) {
		Scanner scanner1 = new Scanner(System.in);
		System.out.print("첫번째 숫자를 입력하세요 : ");
		int temp1 = scanner1.nextInt();
		Scanner scanner2 = new Scanner(System.in);
		System.out.print("두 번째 숫자를 입력하세요 : ");
		int temp2 = scanner2.nextInt();
		String result = (temp1 == temp2) ? "O" : "X";
		System.out.println(result);
		scanner1.close();
		scanner2.close();
	}

}
