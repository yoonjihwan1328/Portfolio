//프로젝트 파일날리면서 못해봄. ★실습예제 3번 직접 써볼것.
package com.lec.condition;

import java.util.Scanner;

//사용
public class Ex01_switch {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("수는 ?");
		int su = scanner.nextInt();
		
//		if (su%2==0) {
//			System.out.println("짝수");
//		} else {
//			System.out.println("홀수");
//		}
		switch(su%2) {	//정수, 문자(char), 문자열만 가능
		case 0: System.out.println("짝수");break;
		case 1: case -1:	// default: 로 대체가능
			System.out.println("홀수");	//break; 입력가능(마지막이니까 안해도 됨)
		
			scanner.close();
		}
	}

}
