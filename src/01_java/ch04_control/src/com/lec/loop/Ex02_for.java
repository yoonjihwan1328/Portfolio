package com.lec.loop;
// 1~20까지 누적
public class Ex02_for {
	public static void main(String[] args) {
		int tot=0;
		for(int i=1; i<=20; i++) {
			tot = tot + i;
			System.out.print(i);
			if(i!=20) {
				System.out.print("+");
			}//if
		}//for
		System.out.println(tot);
	}//main

}//class
