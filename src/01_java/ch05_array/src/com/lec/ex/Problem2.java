package com.lec.ex;
// 2차원 배열에 저장된 값의 합계를 구하시오
public class Problem2 {
	public static void main(String[] args) {
		int[][] arr = {{5, 5, 5, 5, 5}, {10, 10, 10, 10, 10}, {20, 20, 20, 20, 20}, {30, 30, 30, 30, 30}};
		int sum = 0;
		for(int i = 0; i< arr.length; i++ ) {	//1차 배열을 순서대로 반환시킴
			for(int j = 0; j<arr[i].length; j++) {	//2차배열의 값들을 차례대로 호출
				sum = sum + arr[i][j];
			}
		}
		System.out.println(sum);
	}
}
