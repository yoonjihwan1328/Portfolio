package com.lec.ex;
// 삼항연산자 (조건) ? (조건이 참일경우 취할 값) : (조건이 거짓일 경우 취할 값)
public class Ex05_____ {
	public static void main(String[] args) {
		int h = 100 ;
		String result = (h%2 == 0) ? "짝수입니다" : "홀수입니다"; // 회원가입 성공, 실패여부 안내 메세지 등에 쓰임
		System.out.println("삼항연산 결과 = "+result) ;
		
//		int g = 100; String result ;
//		if (g%2 == 0) {
//			result = "짝수입니다";
//		}else {
//			result = "홀수입니다" ;
//		}
//		System.out.println(result);
	}
}
