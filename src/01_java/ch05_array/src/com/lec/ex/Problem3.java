package com.lec.ex;
// 76, 45, 34, 89, 100, 50, 90, 92 8���� ���� 1���� �迭�� �ʱ�ȭ�ϰ� 
// ���� �հ�� ��� �׸��� �ִ밪�� �ּҰ��� ���ϴ� ���α׷��� �ۼ��Ͻÿ�
public class Problem3 {
	public static void main(String[] args) {
		int[] arr;	// arr �̸��� �迭�� ����(�޸𸮰��� Ȯ��x, �ʱⰪ�� �ο����� ���� ����)
		arr = new int[8]; //arr�迭�� �޸� ������ 8x4byte�� Ȯ����
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
		System.out.printf("1���� �迭�� ���� : %d\n", sum);
		
		int avg = 0;
		for (int i=0; i<arr.length; i++) {
			avg = sum/arr.length;
		}
		System.out.printf("1���� �迭�� ����� : %d\n", avg);
		
		int maxarr = 0, minarr = 1000;
		for (int i=0; i<arr.length; i++) {
			if(arr[i] > maxarr) {
				maxarr = arr[i];
			}
			if(arr[i] < minarr) {
				minarr = arr[i];
			}
		}
		System.out.printf("�迭 arr�� �ִ밪�� : %d, �迭 arr�� �ּҰ��� : %d", maxarr, minarr);
				
	}

}
