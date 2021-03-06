package com.lec.ex;
// 절차 지향적인 프로그래밍 : 1~10까지 정수의 합을 구하고 홀/짝 여부 출력
// 중복된 로직이 포함된 main함수를 작성
public class Ex01 {
	public static void main(String[] args) {
		int tot = 0;
		for(int i=1 ; i<11; i++ ) {
			tot += i;
		}
		System.out.println("누적 합은 " + tot);
		System.out.println((tot%2==0)?"짝수":"홀수");
		
		tot = 0;
		for(int i=10 ; i<101; i++ ) {
			tot += i;
		}
		System.out.println("누적 합은 " + tot);
		System.out.println((tot%2==0)?"짝수":"홀수");
	}
}
