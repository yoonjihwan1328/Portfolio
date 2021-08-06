package com.lec.ex;
// 메서드, c언어에서 메서드라 부름, python에서는 함수라 부름
public class Ex02_method {
	public static void main(String[] args) {
		int tot = sum(1, 10);	//1, 10은 argument(인수 or 매개변수 라고 부름)
		System.out.println(evenOdd(tot));
		tot = sum(10, 100);
		System.out.println(evenOdd(tot));
	}	
	
	private static String evenOdd(int i) {
//		String result = "";
//		if(i%2 ==0) {
//			result = "짝수";
//		}else {
//			result = "홀수";
//		}
//		String result = i%2==0 ? "짝수" : "홀수" ;
//		return result;	//return 어디서 봤었지? python인가? 이전 강의인가?

		String result = i%2==0 ? "짝수" : "홀수" ;
		return result;
		
		
		
	}
	private static int sum(int from, int to) {
		int result = 0;
		for(int i = from; i<= to; i++) {
			result +=i;
		}
		return result;
	}


}
