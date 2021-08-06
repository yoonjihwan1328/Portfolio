package com.lec.loop;
// 0 1 2 3 4 5 6 7 8 9 10
public class Ex11_DoWhile {
	public static void main(String[] args) {
		int cnt = 0;
		do {
			System.out.println(cnt + " ");
			cnt++;
		}while(true);
//		System.out.println("DONE");	// 무한 반복되므로 전 행에서 내려오지 않아 본 행이 실행될 일이 없다.
	}
}
