package com.lec.ex;
// 2���� �迭�� ����� ���� �հ踦 ���Ͻÿ�
public class Problem2 {
	public static void main(String[] args) {
		int[][] arr = {{5, 5, 5, 5, 5}, {10, 10, 10, 10, 10}, {20, 20, 20, 20, 20}, {30, 30, 30, 30, 30}};
		int sum = 0;
		for(int i = 0; i< arr.length; i++ ) {	//1�� �迭�� ������� ��ȯ��Ŵ
			for(int j = 0; j<arr[i].length; j++) {	//2���迭�� ������ ���ʴ�� ȣ��
				sum = sum + arr[i][j];
			}
		}
		System.out.println(sum);
	}
}
