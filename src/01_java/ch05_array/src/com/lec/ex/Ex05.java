package com.lec.ex;

import java.util.Scanner;

// ����, ö��, �浿, ����, ���� Ű �Է¹޾� ���
// ���� Ű�� ū �л��� �̸�, Ű
public class Ex05 {
	public static void main(String[] args) {
		String[] arrName = {"����", "ö��", "�浿", "����", "����"};	// name1= xx�� ���� ������ �Է��ϸ� �ϳ��� ������ �� ���� �̸��� �Ҵ��� �� �����Ƿ�...�迭�� ���
		int[] arrHeight = new int[arrName.length];	// int[] arrHeight�� �����ٸ� �迭������ ������ ����(����Ȯ��x �ʱⰪ �Ҵ�x), 
													// ch05_Ex01���� ó�� ���� : new�� �޸� ������ Ȯ���϶�� ��ɾ�
		Scanner scanner = new Scanner(System.in);
		int total = 0;
		for(int idx=0; idx<arrHeight.length; idx++) {
			System.out.print(arrName[idx] + "�� Ű��?");
			arrHeight[idx] = scanner.nextInt();
			total += arrHeight[idx];
		}
		System.out.printf("���Ű : %f\n", total/(double)arrHeight.length );
		System.out.printf("���Ű : %d\n", total/arrHeight.length);
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
		System.out.printf("���� ���� �л��� : %s, Ű : %d\n", arrName[minIdx], minHeight);
		System.out.printf("���� ���� �л��� : %s, Ű : %d\n", arrName[maxIdx], maxHeight);
	}
	// maxIdx�� ���� i �� minIdx�� ���� i�� �����ϰ� ����ص�...������� �ǰ� ������...
}
