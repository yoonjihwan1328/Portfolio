package com.lec.ex;
// 76, 45, 34, 89, 100, 50, 90, 92 8개의 값을 1차원 배열로 초기화하고 
// 값에 합계와 평균 그리고 최대값과 최소값을 구하는 프로그램을 작성하시오
public class Problem3 {
	public static void main(String[] args) {
		int[] arr;	// arr 이름의 배열을 선언(메모리공간 확보x, 초기값이 부여되지 않은 상태)
		arr = new int[8]; //arr배열에 메모리 공간이 8x4byte로 확보됨
		arr[0] = 76;
		arr[1] = 45;
		arr[2] = 34;
		arr[3] = 89;
		arr[4] = 100;
		arr[5] = 50;
		arr[6] = 90;
		arr[7] = 92;
		
		int sum = 0;
		for(int i=0; i<arr.length; i++) {
			sum = sum + arr[i];
		}
		System.out.printf("1차원 배열의 합은 : %d\n", sum);
		
		int avg = 0;
		for (int i=0; i<arr.length; i++) {
			avg = sum/arr.length;
		}
		System.out.printf("1차원 배열의 평균은 : %d\n", avg);
		
		int maxarr = 0, minarr = 1000;
		for (int i=0; i<arr.length; i++) {
			if(arr[i] > maxarr) {
				maxarr = arr[i];
			}
			if(arr[i] < minarr) {
				minarr = arr[i];
			}
		}
		System.out.printf("배열 arr의 최대값은 : %d, 배열 arr의 최소값은 : %d", maxarr, minarr);
				
	}

}
