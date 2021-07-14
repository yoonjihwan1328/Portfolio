package com.lec.ex;

public class VarEx02 {
	public static void main(String[] args) {
		int i = 10 ; // 4byte짜리 i주머니에 10을 넣는다.
		byte j =29 ; // 1byte짜리 j주머니에 20을 할당한다.
		double d = 0.1 ; // 8byte d주머니에 0.1을 할당한다.
		char c = 'C'; // 2byte짜리 문자 c주머니에 '씨'를 할당
		boolean ok = true ;
		long l = 2200000000L;
		System.out.println("i\t j\t d"); // \t탭 println 개행
		System.out.println(i+"/t"+j+"t"+d);
		System.out.println("c\t c\n"); //print는 개행 미포함
		System.out.printf("c=%c, c의 코드값=%d\n", c, (int)c);
		System.out.printf("ok = %b\n", ok);
		System.out.printf("l=%d\n", l);
		System.out.printf("d=%5.2f",d);
		//%d(정수) %f(실수) %b(불린) %x(16진수) %c(문자) %s(문자열)
	}
}
