package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) {
		printLine('■');
		System.out.println("Hello, World!");
		printLine();	// 가는선 하나	sum함수는 합계값을 가지고 돌아왔었음.
		System.out.println("Hello, Java!");
		printLine('■', 30);
	}
	private static void printLine() {
		for(int i=0 ; i<20 ; i++) {
			System.out.print('-') ;
		}
		System.out.println();
	}
	private static void printLine(char ch) {	// 동일한 메서드 명으로 (약간)다른 기능을 하는 메서드를 규정 = 메서드의 오버로딩
		for(int i=0; i<20; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
	private static void printLine(char ch, int cnt) {	
		for(int i=0; i<20; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}


}
