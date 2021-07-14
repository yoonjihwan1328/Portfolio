package com.lec.ex;

public class Ex031 {
	public static void main(String[] args) {
		int n1 = 10, n2 = 5;
		boolean result;
		
		result = (n1 > n2);
		System.out.printf("%d %c %d 는 %b\n", n1, '>', n2, result);
		
		result = (n1 < n2);
		System.out.printf("%d %c %d 는 %b\n", n1, '<', n2, result);
		
		result = (n1 >= n2);
		System.out.printf("%d %s %d 는 %b\n", n1, ">=", n2, result);
		
		result = (n1 <= n2);
		System.out.printf("%d %s %d 는 %b\n", n1, "<=", n2, result);
		
		result = (n1 == n2);
		System.out.printf("%d %s %d는 %b\n", n1, "==", n2, result);
		
		result = (n1 != n2);
		System.out.printf("%d %s %d는 %b\n", n1, "!=", n2, result);
		
	}

}
