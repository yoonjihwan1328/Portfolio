//������Ʈ ���ϳ����鼭 ���غ�. �ڽǽ����� 3�� ���� �Ẽ��.
package com.lec.condition;

import java.util.Scanner;

//����ڷκ��� ������ �Է¹޾� ������ ���
public class Ex02_switch {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ ?");
		int gpa = scanner.nextInt();
		
//		if (gpa>=90 && gpa<=100) {
//			System.out.println("A����");
//		} else if(gpa>=80 && gpa<90) {
//			System.out.println("B����");
//		} else if(gpa>=70 && gpa<80) {
//			System.out.println("C����");
//		} else if(gpa>=60 && gpa<70) {
//			System.out.println("D����");
//		} else if(gpa>=0 && gpa<60) {
//			System.out.println("F����");
//		} else {
//			System.out.println("��ȿ���� ���� �����Դϴ�");
		
//�������� Ǯ��
		int score = scanner.nextInt();
		int temp = (score==100)? gpa-1:gpa;	//100���� ��츦 �����ϱ� ����, case 10���� ������� �ʾҳ�?
		temp = (temp>=-9 && temp<=-1)? temp-10: temp;
		switch(temp/10) {
		
		case 9: System.out.println("A����");break;
		case 8: System.out.println("B����");break;
		case 7: System.out.println("C����");break;
		case 6: System.out.println("D����");break;
		case 5: case 4: case 3: case 2: case 1: case 0:
			System.out.println("F����");break;
		default:
			System.out.println("��ȿ���� ���� ����");
		}
		
		
	}

}
