package com.lec.ex;

public class Arithmetic {

	public int sum(int from, int to) {
		int result = 0; //누적해서 return할 변수
		for(int i=from ; i<=to; i++) {
			result += i;
		}
		return result;
	}
	public int sum(int to) {
		int result = 0;
		for(int i=1 ; i<=to; i++) {
			result+= i;
		}
		return result;
	}
	public String evenOdd(int value) {
		return value%2==0 ? "짝수" : "홀수";
	}
	/*
	 * public int abs(int value) { int result = value >= 0 ? value : -value;
	 * //삼합방정식이 틀렸나? 왜 오류가 뜨지 }
	 */
}//main 함수에서 사용할 수 있는 method 4가지를 Arithmetic 클래스에서 관리하도록 구성함.
