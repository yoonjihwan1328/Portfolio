package com.lec.ex;

public class Ex01 {
	public static void main(String[] args) {
		int i = 10; // ������ ����� �ʱ�ȭ
		int[] iArr = {10,20,30,40,50};	//1.�迭���� ����� �ʱ�ȭ : iArr�̶�� ������ int[] type���� �����. + {10,20,30,40,50}������ �ʱⰪ�� ����
		System.out.println(iArr[1]);	//�迭�� index�� ����(index:0~4)
		iArr[4] = 90;
		System.out.println(iArr[4]);
		
		System.out.print(iArr[0]+"\t");
		System.out.print(iArr[1]+"\t");
		System.out.print(iArr[2]+"\t");
		System.out.print(iArr[3]+"\t");
		System.out.print(iArr[4]+"\n");
		
		for(int idx=0 ; idx<iArr.length ; idx++) {	//iArr.length : �迭�� ũ���� �θ�
			System.out.println(iArr[idx]);
		}
		//***********************************************************************//
		int i2;
		i2 = 10;
		int[] iArr2 = new int[5];	// 2.�迭���� ����� �迭�޸� ����Ȯ��(�迭 ��ü ����), ---new�� �޸� ������ Ȯ���ϴ� ��ɾ�, int 5���� = 20byte�� ����. 
		System.out.println(iArr2[4]);	//�ʱⰪ�� �������� ���� ��� 0���� �ʱ�ȭ �Ǿ�����.(double = 0.0, boolean = false)
		for(int idx=0; idx<iArr2.length; idx++) {	//�Ϲ� for���� �̿��� �迭����
			System.out.println("iArr2�迭��" + idx + "��°�� : " + iArr[idx]);
		}
		
		int[] iArr3 = null;	// 3.�迭������ ����(�迭 ������ Ȯ���� �ȵ�����. �ʱⰪ�� ���� �ȵ�), = null�� �����ص� ��. iArr3 �迭�� ���� ����� �� ���� ������.
		iArr3 = new int[6];	// 0 0 0 0 0 0
		//�迭�� ������ �����Ǹ� ���� ������ �Ұ��ϴ�. <- 7��° ���� pop, append�� insert���� �Ұ����ϳ��� ���ΰ�?????
		for(int idx=0; idx<iArr3.length ; idx++) {
			System.out.println(iArr3[idx]);
		}
		
		//Ȯ�� for���� �̿�
		
		int[] iArr4;
		iArr4 = new int[3];
		///int[] iArr4 = {100, 200, 300}; //������
		iArr4[0]=100;
		for(int temp : iArr4) {
			System.out.println(temp);
		}// temp���� �ڵ� �����ϴ� �͵� �ƴϰ� ������ �ǵ��Ѱ���? �ʱⰪ�� 0���� �ڵ����� �����ǰ� �ڵ� �����ϴµ�? forȮ�屸���� �����ΰǰ�?
		//Ȯ�� ������ �迭�� ���� ������ �� ����
		
		for(int idx=0 ; idx<iArr4.length;idx++) {
			iArr4[idx]=999;
			System.out.println(iArr[idx]);
		}
	}
}
