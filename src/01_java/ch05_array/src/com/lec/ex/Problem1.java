package com.lec.ex;
//배열에 담긴 값을 더하는 프로그램을 작성
public class Problem1 {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50};
		int total=0;
		for(int idx=0; idx<arr.length; idx++) {	// 반복 횟수가 배열내 값의 개수만큼으로 한정되어 있으므로 while보다는 for가 선택된듯
			total = total + arr[idx];
		}
		System.out.println(total);
	}
}
// for(int temp : arr) {
//		tot += temp;
//	}
//	System.out.println(tot);