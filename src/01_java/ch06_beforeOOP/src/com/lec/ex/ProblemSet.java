//package com.lec.ex;
//
//import java.util.Scanner;
//
//public class ProblemSet {
//	public static void main(String[] args) {
//		Scanner scanner = new Scanner(System.in);
//		int mulTable;
//		System.out.println("���ϴ� �������� �ܼ��� �Է��ϼ��� : ");
//		do {
//			mulTable = scanner.nextInt();
//			if (mulTable <= 2) break;
//			System.out.println("2~9������ ���� �Է��ϼ��� : ");
//			
//			if(mulTable > 9) break;
//			System.out.println("2~9������ ���� �Է��ϼ��� : ");
//		}while(true);
//		int result = multiplication(mulTable);
////		System.out.println("������ " + mulTable + "�� :");
//	}
//	private static int multiplication(int mulTable) {
//		int result =1;
//		for(int i = mulTable; i<10; i++) {
//			for(int j = 1; j<10; j++) {
//				result = System.out.printf("%d * %d = %d\n", i, j, i*j);
//			}
//			return result;	
//		}
//		
		
//		int[] result = new int[8];
//			result[idx] = mulTable * (idx+2) ;
//		}
//		System.out.printf("%d + * mulTable = %" , mulTable, result);
//		
		
///*
// * }
// * 
// * 
// * }
// */