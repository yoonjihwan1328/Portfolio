package com.lec.loop;

public class Ex11_1_DoWhile {
	public static void main(String[] args) {
		int cnt = 0;
		do {
			System.out.print(cnt + ", ");;
			if(cnt==10)break;
			cnt++;
		}while(true);
	}
}
// do {} 안에 선언된 변수는 해당 {}를 벗어나서는 작동하지 않음. 따라서  while() 조건으로 사용할 수 없음.
//int temp를 추가하고 while안에 temp조건을 부여했는데 받아적지 못함.