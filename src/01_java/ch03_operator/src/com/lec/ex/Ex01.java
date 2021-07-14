package com.lec.ex;
// 산술연산자 : + - * / &
public class Ex01 {
	public static void main(String[] args) {
		int n1 = 33, n2 = 10 ;
		int result; double resultDouble ;
		result = n1 + n2;
		System.out.printf("%d %c %d = %d\n", n1, '+', n2, result) ;	//문자 1개인 경우'', 문자가 2개 이상인 경우 ""
		result = n1 * n2;
		System.out.printf("%d %c %d = %d\n", n1, '*', n2, result) ;
		result = n1 / n2;
		System.out.printf("%d %c %d = %d\n", n1, '/', n2, result) ;
		// int 연산 int = int 값으로 출력됨. result 가 int로 설정되어있기 때문이 아님.
		resultDouble = n1 / n2;
		System.out.printf("%d %c %d = %f\n", n1, '/', n2, resultDouble) ;
		// double인 resultDouble인 경우에도 3.3이 도출되지 않고 3.0으로 형식만 실수가 됨.
		resultDouble = (double)n1 / n2;
		System.out.printf("%d %c %d = %f\n", n1, '/', n2, resultDouble) ;
//		result = (double)n1 / n2;
//		System.out.printf("%d %c %d = %f\n", n1, '/', n2, result) ;
//오류
		result = n1 % n2; // n1 나누기 n2의 나머지
		System.out.printf("%d %c %d = %d\n", n1, '%', n2, result) ;
		// 나머지 연산자의 쓰임 : 짝홀수 판별, 배수판별, 1만병중 100번째 해당하는 인원들에 대한 분석을 하고싶음.
		if(n1 % 2 == 0) {
			System.out.println("n1은 짝수") ;
		}else {
			System.out.println("n1은 홀수") ;
		}
		if(n2 % 5 == 0) {
			System.out.println("n2는 5의 배수") ;
		} else {
			System.out.println("n2는 5의 배수가 아니다.") ;
		}
		
	}

}
