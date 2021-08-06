//프로젝트 파일날리면서 못해봄. ★실습예제 3번 직접 써볼것.
package com.lec.condition;

import java.util.Scanner;

//사용자로부터 점수를 입력받아 학점을 출력
public class Ex02_switch {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("학점은 ?");
		int gpa = scanner.nextInt();
		
//		if (gpa>=90 && gpa<=100) {
//			System.out.println("A학점");
//		} else if(gpa>=80 && gpa<90) {
//			System.out.println("B학점");
//		} else if(gpa>=70 && gpa<80) {
//			System.out.println("C학점");
//		} else if(gpa>=60 && gpa<70) {
//			System.out.println("D학점");
//		} else if(gpa>=0 && gpa<60) {
//			System.out.println("F학점");
//		} else {
//			System.out.println("유효하지 않은 점수입니다");
		
//옳지않은 풀이
		int score = scanner.nextInt();
		int temp = (score==100)? gpa-1:gpa;	//100점인 경우를 포함하기 위해, case 10으로 충분하지 않았나?
		temp = (temp>=-9 && temp<=-1)? temp-10: temp;
		switch(temp/10) {
		
		case 9: System.out.println("A학점");break;
		case 8: System.out.println("B학점");break;
		case 7: System.out.println("C학점");break;
		case 6: System.out.println("D학점");break;
		case 5: case 4: case 3: case 2: case 1: case 0:
			System.out.println("F학점");break;
		default:
			System.out.println("유효하지 않은 점수");
		}
		
		
	}

}
