package com.lec.ex;
// ���� �������� ���α׷��� : 1~10���� ������ ���� ���ϰ� Ȧ/¦ ���� ���
// �ߺ��� ������ ���Ե� main�Լ��� �ۼ�
public class Ex01 {
	public static void main(String[] args) {
		int tot = 0;
		for(int i=1 ; i<11; i++ ) {
			tot += i;
		}
		System.out.println("���� ���� " + tot);
		System.out.println((tot%2==0)?"¦��":"Ȧ��");
		
		tot = 0;
		for(int i=10 ; i<101; i++ ) {
			tot += i;
		}
		System.out.println("���� ���� " + tot);
		System.out.println((tot%2==0)?"¦��":"Ȧ��");
	}
}
