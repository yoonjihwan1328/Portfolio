package com.lect.ex0_janmuri;

public class WarmingUp {
	public static void main(String[] args) {
		String name = "�̸�";
		String kor = "����";
		String eng = "����";
		String math = "����";
		String tot = "����";
		String aveName = "���";
		
		frameLine('��');
		System.out.println("����ǥ");
//		dottedLine('-';)

	}
	
	public static void frameLine(char ch) {
		for(int i=0; i<30; i++) {
			System.out.print(ch);
		}
	}
//	public void inforPrint() {
//		System.out.printf("\t %s \t %d \t %d \t %d \t %d \t %.1f\n", name, kor, eng, mat, tot, avg);
//		System.out.println();
//	}
	
	
//	
//	public String inforString() {
//		String result = "\t" + name + "\t" + kor + "\t" + eng + "\t" + mat + "\t" + tot + "\t" + agv;
//		result = String.format("\t %s \t %d \t %d \t %d \t %d \t %.1f\n", name, kor, eng, mat, tot, avg);
//		return result
//	}
	// inforPrint()�� ������ ���

}
