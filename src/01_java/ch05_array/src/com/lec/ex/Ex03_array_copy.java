package com.lec.ex;

public class Ex03_array_copy {
	public static void main(String[] args) {
		int[] score = {100, 20, 30, 40, 50};
		int[] s = new int[score.length];	//score�� ������ ũ���� �޸𸮸� Ȯ��
		for(int i=0 ; i<score.length ; i++) {
			s[i] = score[i];	//score�� ������ ������ �Ҵ�
		}
		for(int i=0; i<s.length; i++) {
			System.out.printf("s[%d]=%d, score[%d]=%d\n", i , s[i], i, score[i]);
		}
		s[0] = 90;
		System.out.println("s�迭�� �� ���� ��");
		for(int i=0; i<s.length; i++) {
			System.out.printf("s[%d]=%d, score[%d]=%d\n", i , s[i], i, score[i]);
		}
	}
}
// �� �迭�� ���ο� ���� �����Ǵ� ��� �� �迭�� ���� �ٸ� ������ ������ �ȴ�.

// Systemarraycopy ???...???