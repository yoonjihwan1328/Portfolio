package com.lec.ex;
//�迭�� ��� ���� ���ϴ� ���α׷��� �ۼ�
public class Problem1 {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50};
		int total=0;
		for(int idx=0; idx<arr.length; idx++) {	// �ݺ� Ƚ���� �迭�� ���� ������ŭ���� �����Ǿ� �����Ƿ� while���ٴ� for�� ���õȵ�
			total = total + arr[idx];
		}
		System.out.println(total);
	}
}
// for(int temp : arr) {
//		tot += temp;
//	}
//	System.out.println(tot);