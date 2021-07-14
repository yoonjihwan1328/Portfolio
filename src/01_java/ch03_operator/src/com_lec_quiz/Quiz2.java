package com_lec_quiz;

import java.util.Scanner;

public class Quiz2 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("수를 입력하세요 : ");
		int temp = input.nextInt();
		String result = (temp % 2 ==0) ? "짝수입니다" : "홀수입니다" ;
		System.out.println("입력하신 수는 " + result) ;
		input.close();
		
	}

}
