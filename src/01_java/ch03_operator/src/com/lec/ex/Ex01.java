package com.lec.ex;
// ��������� : + - * / &
public class Ex01 {
	public static void main(String[] args) {
		int n1 = 33, n2 = 10 ;
		int result; double resultDouble ;
		result = n1 + n2;
		System.out.printf("%d %c %d = %d\n", n1, '+', n2, result) ;	//���� 1���� ���'', ���ڰ� 2�� �̻��� ��� ""
		result = n1 * n2;
		System.out.printf("%d %c %d = %d\n", n1, '*', n2, result) ;
		result = n1 / n2;
		System.out.printf("%d %c %d = %d\n", n1, '/', n2, result) ;
		// int ���� int = int ������ ��µ�. result �� int�� �����Ǿ��ֱ� ������ �ƴ�.
		resultDouble = n1 / n2;
		System.out.printf("%d %c %d = %f\n", n1, '/', n2, resultDouble) ;
		// double�� resultDouble�� ��쿡�� 3.3�� ������� �ʰ� 3.0���� ���ĸ� �Ǽ��� ��.
		resultDouble = (double)n1 / n2;
		System.out.printf("%d %c %d = %f\n", n1, '/', n2, resultDouble) ;
//		result = (double)n1 / n2;
//		System.out.printf("%d %c %d = %f\n", n1, '/', n2, result) ;
//����
		result = n1 % n2; // n1 ������ n2�� ������
		System.out.printf("%d %c %d = %d\n", n1, '%', n2, result) ;
		// ������ �������� ���� : ¦Ȧ�� �Ǻ�, ����Ǻ�, 1������ 100��° �ش��ϴ� �ο��鿡 ���� �м��� �ϰ����.
		if(n1 % 2 == 0) {
			System.out.println("n1�� ¦��") ;
		}else {
			System.out.println("n1�� Ȧ��") ;
		}
		if(n2 % 5 == 0) {
			System.out.println("n2�� 5�� ���") ;
		} else {
			System.out.println("n2�� 5�� ����� �ƴϴ�.") ;
		}
		
	}

}
