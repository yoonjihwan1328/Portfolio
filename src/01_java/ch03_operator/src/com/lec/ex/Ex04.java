package com.lec.ex;
// �������� : &&(AND), ||(OR), !
public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10 ;
		System.out.println("(i<j) && (++j>h) : " + ((i<j) && (++j>h))) ;
		System.out.println("(i<j) && (++j>h) : " +((i<j) && (++j>h))) ;
		System.out.println("j=" + j) ;
		System.out.println("(i>j) && (++j>h) : " +((i>j) && (++j>h))) ;
		System.out.println("j=" + j) ;	// i>j�� false���� ������ ++j�� ������� �ʾҴ�.(���� ��Ȯ���� ��ü ����� false�̱⿡ �ļ� ������ ������� ����)
		System.out.println("OR(||)") ;
		System.out.println("(i>j) || (++j>h) : " +((i>j) || (++j>h))) ;
		System.out.println("j=" + j) ;	// OR������ ���� false�� ���� ���굵 Ȯ���ؾ��ϱ� ������ ���� ������ �����
		System.out.println("(i<j) || (++j>h) : " +((i<j) || (++j>h))) ;
		System.out.println("j=" + j) ;	// OR������ ���� true�̸� ���� ������ Ȯ���� �ʿ䰡 ���� ������ ���� ������ ������� ����!!!
		///��OR������ �� ture/false ���ο� ���� ��ġ if�� ó�� Ȱ���� �����ϱ⵵ �ϴ�(javascript) 
	}

}
