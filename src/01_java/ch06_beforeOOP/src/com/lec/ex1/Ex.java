package com.lec.ex1;

import com.lec.ex.Arithmetic;

// 다른 패키지의 class를 사용할 경우 import 필요
public class Ex {
	public static void main(String[] args) {
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(10,100);
		System.out.println(ar.evenOdd(tot));
		tot = ar.sum(10);
		System.out.println(ar.evenOdd(tot));
			
	}// 매개변수 하나짜리는 protected로 설정되어 있으니 실행이 불가해야하는 것 아닌가? -> Arithmetic.java에서 지우니까 안됨 ㅇㅅㅇ...


}
