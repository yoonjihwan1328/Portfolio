package com.lec.ex;

public class Arithmetic {

	public int sum(int from, int to) {
		int result = 0; //�����ؼ� return�� ����
		for(int i=from ; i<=to; i++) {
			result += i;
		}
		return result;
	}
	public int sum(int to) {
		int result = 0;
		for(int i=1 ; i<=to; i++) {
			result+= i;
		}
		return result;
	}
	public String evenOdd(int value) {
		return value%2==0 ? "¦��" : "Ȧ��";
	}
	/*
	 * public int abs(int value) { int result = value >= 0 ? value : -value;
	 * //���չ������� Ʋ�ȳ�? �� ������ ���� }
	 */
}//main �Լ����� ����� �� �ִ� method 4������ Arithmetic Ŭ�������� �����ϵ��� ������.
