
package com.lec.loop;

import java.util.Scanner;

// ��ǻ�Ͱ� �߻��� �ζǹ�ȣ(1~45) �� ���� ���ߴ� ���α׷� public class
public class Ex12_DoWhilelotto2 {
	public static void main(String[] args) {
		int su, lotto;
		int min = 1, max = 45; // �ּҰ�, �ִ밪 ����
		Scanner scanner = new Scanner(System.in);
		lotto = (int)(Math.random()*45) +1;
		do {
			System.out.printf("%d~%d ������ ���ڸ� ���纸����", min, max);
			su = scanner.nextInt();
			if(su<lotto) {
				System.out.println("�Է��Ͻ� ������ ū ������");
			}else if(su>lotto) {
				System.out.println("�Է��Ͻ� ������ ���� ������");
			}
		}while(su!=lotto);
		System.out.println("�����մϴ�. �ζ� ��ȣ�� ���߼̽��ϴ�");
	}
}


//0<= Math.random() < 1 
//0<= Math.random()*45 < 45 
//(int)(Math.random()*45) ;
//0~44������ ���� ����
