//class���� �ݵ�� �빮�ڷ� ������ ��. �ѱ۷� �ۼ����� �� ��, Ư�����ڴ� _�� ��밡��
package com.lec.ex;
//���������� : ++, --
public class Ex02 {
	public static void main(String[] args) {
		int numFirst = 10;	///�ĺ���(n1)�� ����(?)
		numFirst++; // numFirst ���� �ϳ� ����
		System.out.println(numFirst) ;
		numFirst--;	// numFirst ���� �ϳ� ����
		System.out.println(numFirst) ;
		++numFirst; // 
		System.out.println(numFirst) ;
		int n = numFirst++ ;
		System.out.printf("n=%d, numFirst=%d\n", n,  numFirst) ;
		System.out.printf("n=%d\n", n) ;	// ���� �߰��� �κ�. 13th row�� ++�� �ݿ��� �ȵǳ�?-> numFirst�� �ݿ����� n���� ���� �ݿ��� �ȵ�. �ٵ� �����ٿ��� 2�� �ѹ��� ������...��
		n = ++numFirst;
		System.out.printf("n=%d, numFirst=%d\n", n,  numFirst) ;	//���������� �߰��� row
		n = numFirst--;
		System.out.printf("n=%d, numFirst=%d\n", n, numFirst) ;
		
	}

}	// int n = numFirst++; �� ���� �� n�� numFirst���� 1 ū ���� ���� ���̶�� �����ߴµ�,
	//	�ٷ� ����� �ǽ��ϸ� n�� numFirst�� ++�� ����Ǳ� �� ���� ��ȯ�ϰ� numFirst�� ��ٷ� 1�� ������Ų ���� ��ȯ�Ѵ�.
	//	Ȥ�� n = numFirst++ Ȥ�� numFirst--�� ���� �����ϴ� �� �ݴ�� �۵��ϴµ�.
	//	���� �߰��� �κп� ���߾ �� �Ҵ��� ��->��� �̷������ �׿� ���� ���� ���ص� ������ ������ ����. ������ �������� Ȯ���ǰ� ���� ++�� �տ� �����ִ��� �ڿ� �����ִ����� ���� ���� n�� ���� ����