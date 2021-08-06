package com.lec.ex;

public class temp {
	public static void main(String[] args) {
		int i;
		int[] iArr = {10, 20, 30, 40, 50};
		System.out.println(iArr[0]);
		for(i=0; i<iArr.length; i++) {
			System.out.println(iArr[i]);
		}
		//*****************************************************
		int[] jArr = new int[5];
		jArr[0] = 100;
		jArr[1] = 200;
		jArr[2] = 300;
		jArr[3] = 400;
		jArr[4] = 500;
		for(i=0;i<jArr.length;i++) {
			System.out.print(jArr[i] + "\t");
			System.out.println();
		}
		//******************************************************
		String[] names = {"임꺽정", "홍길동", "성춘향"};
		for(String a:names) {	//요소의 입력기준이 무엇이지? (임의의 변수명 : 배열명)
			System.out.print(a+"\t");	//확장 for구문
		}
	}
}
