package com.lec.loop;
// 1~10 누적곱, 1~10까지의 곱을 구해보자
public class Quiz01 {
	public static void main(String[] args) {
		long tot = 1;
		for(int i=1; i<=10; i++) {
			tot = tot * 1;	// tot=*=i;
		}
		System.out.println("1~10까지 누적곱은 " + tot);	
	}

}
