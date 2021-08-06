package com.lec.loop;

import java.util.Scanner;

public class Ex10_DoWhile {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num;
		do {
			System.out.print("반드시 짝수를 입력하세요 : ");
			num = scanner.nextInt();	// 사용자로부터 숫자를 입력받음
			
		}while(num%2 == 1 || num%2==-1);	//(num%2 != 0); 도 가능
		System.out.println("입력하신 짝수는 " + num);
		scanner.close();
	}

	
}
