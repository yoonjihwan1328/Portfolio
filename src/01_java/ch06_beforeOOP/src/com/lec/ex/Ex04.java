package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) {
		printLine('��');
		System.out.println("Hello, World!");
		printLine();	// ���¼� �ϳ�	sum�Լ��� �հ谪�� ������ ���ƿԾ���.
		System.out.println("Hello, Java!");
		printLine('��', 30);
	}
	private static void printLine() {
		for(int i=0 ; i<20 ; i++) {
			System.out.print('-') ;
		}
		System.out.println();
	}
	private static void printLine(char ch) {	// ������ �޼��� ������ (�ణ)�ٸ� ����� �ϴ� �޼��带 ���� = �޼����� �����ε�
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
