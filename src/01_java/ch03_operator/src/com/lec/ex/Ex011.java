package com.lec.ex;

public class Ex011 {
	public static void main(String[] args) {
		int n1 = 33, n2 = 10 ;	// 
		int result;
		double resultDouble;
		
		result = n1 + n2;
		System.out.printf("%d %c $d = %d\n", n1, '+', n2, result);
		result = n1 - n2;
		System.out.printf("%d %c %d = %d\n", n1, '-', n2, result);	///�� ������ ����???
		result = n1 * n2;
		System.out.printf("%d %c %d = %d\n", n1, '*', n2, result);
		result = (n1 / n2);
		System.out.printf("%d %c %d = %d\n", n1, '/', n2, result);
		resultDouble = (double)(n1 / n2);
		System.out.printf("%d %c %d = %f\n",  n1, '/', n2, resultDouble);
		resultDouble = (double) n1 / n2;
		System.out.printf("%d %c %d = %f\n",  n1, '/', n2, resultDouble);
		result = n1 % n2;
		System.out.printf("%d %c %d = %d\n", n1, '%', n2, result);
		
		if((n1 % 2)==0) {
			System.out.println("n1�� ¦���Դϴ�.\n");
		} else {
			System.out.println("n1�� Ȧ���Դϴ�.\n");
		}
		if((n1 % 5) == 0) {
			System.out.println("n1�� 5�� ����Դϴ�");
		} else {
			System.out.println("n1�� 5�� ����� �ƴմϴ�");
		}
		
		
	}
}

