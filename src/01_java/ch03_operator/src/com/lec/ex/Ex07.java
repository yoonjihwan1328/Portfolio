package com.lec.ex;
//��Ʈ������ &(AND), |(OR), ^(XOR; ���� �ٸ� ���϶��� 1)	--- &&, || ���� ���̴�?
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
