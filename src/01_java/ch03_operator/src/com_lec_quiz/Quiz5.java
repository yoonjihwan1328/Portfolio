package com_lec_quiz;

import java.util.Scanner;

public class Quiz5 {
	public static void main(String[] args) {
		Scanner scanner1 = new Scanner(System.in);
		System.out.print("���� ������ �Է��ϼ��� : ");
		int kpoint = scanner1.nextInt();
		
		Scanner scanner2 = new Scanner(System.in);
		System.out.print("���� ������ �Է��ϼ��� : ");
		int epoint = scanner2.nextInt();
		
		Scanner scanner3 = new Scanner(System.in);
		System.out.print("���� ������ �Է��ϼ��� : ");
		int mpoint = scanner3.nextInt();
		
		System.out.print("���� : " + (kpoint + mpoint +epoint) + "," + "\n" + "��� : " + (kpoint + epoint + mpoint)/3) ; 
		scanner1.close();
		scanner2.close();
		scanner3.close();
	}

}
