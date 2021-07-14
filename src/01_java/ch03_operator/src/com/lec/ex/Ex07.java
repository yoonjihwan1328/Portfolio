package com.lec.ex;
//비트연산자 &(AND), |(OR), ^(XOR; 서로 다른 값일때만 1)	--- &&, || 과의 차이는?
public class Ex07 {
	public static void main(String[] args) {
		int n1 = 10 ;	// 0 ~ 01010
		int n2 = 6 ;	// 0 ~ 00110
		int result ;
		result = n1 & n2 ;	// 0 ~ 00010
		System.out.println("n1 & n2 = " + result) ;
		result = n1 | n2 ;	//	0 ~ 01110
		System.out.printf("n1 | n2 = %x (%d) \n", result, result) ;
		
		result = n1 ^ n2;	// 0 ~ 01100
		System.out.printf("n1 ^ n2 = %x (%d) \n",  result, result) ;
	}

}
