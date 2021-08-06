package com.lec.loop;
// 1부터 20까지 정수 중에서 2와 3의 배수가 아닌 수의 합
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
