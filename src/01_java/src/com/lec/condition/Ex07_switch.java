package com.lec.condition;
//��ǻ�Ͱ� �߻��� ����(����)�� ���� ���
public class Ex07_switch {
	public static void main(String[] args) {
		/*
		 * 0<=Math.random() <1 
		 * 0<= Math.random()*101 <101 
		 * (int)(Math.random()*101) : 0~100������ ���� ����
		 */
		int score = (int)(Math.random()*101) ;
		switch (score/10) {
		case 10: case 9 :
			System.out.println("A����"); break;
		case 8 : System.out.println("B����"); break;
		case 7 : System.out.println("C����"); break;
		case 6 : System.out.println("D����"); break;
		default :
		System.out.println("F����") ;
		}
	}	// main
	
}	//class
