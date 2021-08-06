package com.lec.ex;

import java.util.Scanner;

// 3! = 3* 2* 1
// 2! = 2* 1
// 1! = 1
// 재귀호출
// n! = (n-1)! <n!=1 일때.

public class Ex05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int su;
		System.out.print("몇 !을 계산할까요?");
		do {
			su = sc.nextInt();
			if(su>0) break;
			System.out.println("양수를 입력하셔야 !을 계산할 수 있습니다.");
		}while(true);
		long result = factorial(su);
		System.out.println(su + "!= " + result);
	}
	
	private static long factorial(int su) {
		long result = 1;
		for (int i=su; i>=1; i--) {
			result = result * i;
		}
		return result;
	}
	
// n! = (n-1)! <n!=1 일때.##############################################
//	private static long factorial(int su) {
//		if(su<=1) {
//			return 1;
//		} else {
//			return su*factorial(su-1);
//		}
//	}
}
