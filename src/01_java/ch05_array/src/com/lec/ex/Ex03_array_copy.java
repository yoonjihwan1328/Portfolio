package com.lec.ex;

public class Ex03_array_copy {
	public static void main(String[] args) {
		int[] score = {100, 20, 30, 40, 50};
		int[] s = new int[score.length];	//score와 동일한 크기의 메모리를 확보
		for(int i=0 ; i<score.length ; i++) {
			s[i] = score[i];	//score와 동일한 값들을 할당
		}
		for(int i=0; i<s.length; i++) {
			System.out.printf("s[%d]=%d, score[%d]=%d\n", i , s[i], i, score[i]);
		}
		s[0] = 90;
		System.out.println("s배열의 값 변경 후");
		for(int i=0; i<s.length; i++) {
			System.out.printf("s[%d]=%d, score[%d]=%d\n", i , s[i], i, score[i]);
		}
	}
}
// 한 배열에 새로운 값이 배정되는 경우 두 배열은 각각 다른 구성을 가지게 된다.

// Systemarraycopy ???...???