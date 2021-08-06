package com.lec.condition;

public class Ex01_if {
	public static void main(String[] args) {
		int seoulLunchPrice = 5000;
		if(seoulLunchPrice >= 7000) {
			System.out.println("¼­¿ï Á¡½É°ª ºñ½Î³×¿ä");
		} else if(seoulLunchPrice >= 6000){
			System.out.println("¹¹ ±¦Âú³×");
		} else {
			System.out.println("ÁÁ³×");
		}
	}

}
