package com.lec.ex;

import java.util.Scanner;

// 영희, 철수, 길동, 영수, 말자 키 입력받아 평균
// 가장 키가 큰 학생의 이름, 키
public class Ex05 {
	public static void main(String[] args) {
		String[] arrName = {"영희", "철수", "길동", "영수", "말자"};	// name1= xx와 같은 식으로 입력하면 하나의 변수에 한 명의 이름만 할당할 수 있으므로...배열을 사용
		int[] arrHeight = new int[arrName.length];	// int[] arrHeight로 끝낸다면 배열변수만 선언한 것임(공간확보x 초기값 할당x), 
													// ch05_Ex01에서 처음 설명 : new는 메모리 공간을 확보하라는 명령어
		Scanner scanner = new Scanner(System.in);
		int total = 0;
		for(int idx=0; idx<arrHeight.length; idx++) {
			System.out.print(arrName[idx] + "의 키는?");
			arrHeight[idx] = scanner.nextInt();
			total += arrHeight[idx];
		}
		System.out.printf("평균키 : %f\n", total/(double)arrHeight.length );
		System.out.printf("평균키 : %d\n", total/arrHeight.length);
		scanner.close();
		
		int maxIdx=0, maxHeight = 0;
		int minIdx=0, minHeight=999;
		for (int i=0; i<arrHeight.length; i++) {
			if(arrHeight[i]>maxHeight) {
				maxHeight = arrHeight[i];
				maxIdx = i;
			}
			if(arrHeight[i]<minHeight) {
				minHeight=arrHeight[i];
				minIdx = i;
			}//if
		}//for
		System.out.printf("가장 작은 학생은 : %s, 키 : %d\n", arrName[minIdx], minHeight);
		System.out.printf("가장 작은 학생은 : %s, 키 : %d\n", arrName[maxIdx], maxHeight);
	}
	// maxIdx를 위한 i 와 minIdx를 위한 i를 동일하게 사용해도...결과값이 옳게 나오넹...
}
