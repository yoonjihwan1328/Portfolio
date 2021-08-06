package com.lec.loop;
// 1~10까지 숫자 중 짝수 또는 홀수의 합을 구해보자
public class Quiz02 {
	public static void main(String[] args) {
		int evennum = 0;
		for(int i=0; i<=10; i++) {
			if(i%2==0)
				evennum += i;
			}
			System.out.printf("짝수의 합 : %d\n", evennum);
		
		int oddnum= 0;
		for(int j=0; j<=10; j++) {
			if(j%2==1)
				oddnum += j; // for구문이 병렬로 나란히 있으면 안되나?
			}
		System.out.printf("홀수의 합 : %d", oddnum);
	
		}
		
	}


