package com.lec.ex;

public class Ex02 {
	public static void main(String[] args) {
		int i = 10;
		int j = i;
		j=99;
		System.out.printf("i=%d, j=%d\n", i, j);
		
		//배열의 경우 = 기호가 배정이 아닌 동일==과 일치한 의미를 가짐
		int[] score = {100,20,30,40,50};
		int[] s = score;
		s[0] = 99;
		for(int idx = 0; idx<s.length; idx++) {
			
		}
		
//		두 배열에 같은 주소값을 갖기때문에 항상 일치하는 값들을 가지게 된다. 		
//		******************************* 별도의 배열을 운용하고 싶은 경우 ****************************
//		배열을 복사하고 독립적인 두 배열이 필요할 수 있음. 다음 class참조
	}
}
