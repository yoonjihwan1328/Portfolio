package com_lec_quiz;

import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("수를 입력하세요 : ");
		int temp = scanner.nextInt() ; // 키보드로부터 입력받은 정수를 반환받는 함수
		String result = (temp >= 65) ? "경로우대" : "일반" ;
		System.out.println(result) ;
		scanner.close();
	}

}
