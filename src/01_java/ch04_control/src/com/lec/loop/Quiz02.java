package com.lec.loop;
// 1~10���� ���� �� ¦�� �Ǵ� Ȧ���� ���� ���غ���
public class Quiz02 {
	public static void main(String[] args) {
		int evennum = 0;
		for(int i=0; i<=10; i++) {
			if(i%2==0)
				evennum += i;
			}
			System.out.printf("¦���� �� : %d\n", evennum);
		
		int oddnum= 0;
		for(int j=0; j<=10; j++) {
			if(j%2==1)
				oddnum += j; // for������ ���ķ� ������ ������ �ȵǳ�?
			}
		System.out.printf("Ȧ���� �� : %d", oddnum);
	
		}
		
	}


