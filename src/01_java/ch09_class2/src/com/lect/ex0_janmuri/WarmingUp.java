package com.lect.ex0_janmuri;

public class WarmingUp {
	public static void main(String[] args) {
		String name = "이름";
		String kor = "국어";
		String eng = "영어";
		String math = "수학";
		String tot = "총점";
		String aveName = "평균";
		
		frameLine('■');
		System.out.println("성적표");
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
	// inforPrint()와 동일한 결과

}
