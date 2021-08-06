
package com.lec.loop;

import java.util.Scanner;

// 컴퓨터가 발생한 로또번호(1~45) 한 개를 맞추는 프로그램 public class
public class Ex12_DoWhilelotto2 {
	public static void main(String[] args) {
		int su, lotto;
		int min = 1, max = 45; // 최소값, 최대값 설정
		Scanner scanner = new Scanner(System.in);
		lotto = (int)(Math.random()*45) +1;
		do {
			System.out.printf("%d~%d 사이의 숫자를 맞춰보세요", min, max);
			su = scanner.nextInt();
			if(su<lotto) {
				System.out.println("입력하신 수보다 큰 수에요");
			}else if(su>lotto) {
				System.out.println("입력하신 수보다 작은 수에요");
			}
		}while(su!=lotto);
		System.out.println("축하합니다. 로또 번호를 맞추셨습니다");
	}
}


//0<= Math.random() < 1 
//0<= Math.random()*45 < 45 
//(int)(Math.random()*45) ;
//0~44까지의 정수 난수
