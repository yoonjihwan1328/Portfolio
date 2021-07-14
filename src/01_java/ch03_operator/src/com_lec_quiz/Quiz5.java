package com_lec_quiz;

import java.util.Scanner;

public class Quiz5 {
	public static void main(String[] args) {
		Scanner scanner1 = new Scanner(System.in);
		System.out.print("국어 점수를 입력하세요 : ");
		int kpoint = scanner1.nextInt();
		
		Scanner scanner2 = new Scanner(System.in);
		System.out.print("영어 점수를 입력하세요 : ");
		int epoint = scanner2.nextInt();
		
		Scanner scanner3 = new Scanner(System.in);
		System.out.print("수학 점수를 입력하세요 : ");
		int mpoint = scanner3.nextInt();
		
		System.out.print("총점 : " + (kpoint + mpoint +epoint) + "," + "\n" + "평균 : " + (kpoint + epoint + mpoint)/3) ; 
		scanner1.close();
		scanner2.close();
		scanner3.close();
	}

}
