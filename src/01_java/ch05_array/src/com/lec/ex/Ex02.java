package com.lec.ex;

public class Ex02 {
	public static void main(String[] args) {
		int i = 10;
		int j = i;
		j=99;
		System.out.printf("i=%d, j=%d\n", i, j);
		
		//�迭�� ��� = ��ȣ�� ������ �ƴ� ����==�� ��ġ�� �ǹ̸� ����
		int[] score = {100,20,30,40,50};
		int[] s = score;
		s[0] = 99;
		for(int idx = 0; idx<s.length; idx++) {
			
		}
		
//		�� �迭�� ���� �ּҰ��� ���⶧���� �׻� ��ġ�ϴ� ������ ������ �ȴ�. 		
//		******************************* ������ �迭�� ����ϰ� ���� ��� ****************************
//		�迭�� �����ϰ� �������� �� �迭�� �ʿ��� �� ����. ���� class����
	}
}
