package com.lec.loop;
// 1���� 20���� ���� �߿��� 2�� 3�� ����� �ƴ� ���� ��
public class Quiz_DoWhile {
	public static void main(String[] args) {
		int cnt = 0;
		int tot = 0;
		do {
			cnt++;
			tot = tot + cnt;
		}while(cnt%2 != 0 && cnt%3 !=0 && cnt<=20 );
		System.out.println(tot);
	}
}
