package com.lec.ex;
// 형변환에는 1)묵시적인형 변환, 2)명시적인 형변환
public class VarEx06 {
	public static void main(String[] args) {
		int i1 = 10;
		double d1 = i1;	// i1변수의 값을 d1에 할당 - 묵시적인 형변환(작은 주머니 데이터를 큰 주머니에 할당할 때)
		System.out.printf("i1 = %d, d1 = %.2f\n", i1, d1); // i1이 double로 할당되며 자동으로 형변환이 이루어졌음을 알 수 있음
		d1 = 10.9 ;
		i1 = (int)d1 ; // 명시적인 형변환(큰 주머니 데이터를 작은 주머니에 할당, 형변환을 실시하지 않으면 err발생)
		System.out.printf("i1=%d, d1=%.2f\n",  i1, d1) ;
		
	}

}
