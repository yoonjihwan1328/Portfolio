//������Ʈ ���ϳ����鼭 ���غ�. �ڽǽ����� 3�� ���� �Ẽ��.
package com.lec.condition;

import java.util.Scanner;

//���
public class Ex01_switch {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� ?");
		int su = scanner.nextInt();
		
//		if (su%2==0) {
//			System.out.println("¦��");
//		} else {
//			System.out.println("Ȧ��");
//		}
		switch(su%2) {	//����, ����(char), ���ڿ��� ����
		case 0: System.out.println("¦��");break;
		case 1: case -1:	// default: �� ��ü����
			System.out.println("Ȧ��");	//break; �Է°���(�������̴ϱ� ���ص� ��)
		
			scanner.close();
		}
	}

}
