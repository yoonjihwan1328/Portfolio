package com.lec.loop;
//1~100���� ���� �� 3�� ������� ���� ���
public class Ex09_while {
	public static void main(String[] args) {
		int tot = 0 ;	// int = tot�θ� �����ϸ� ���� �Ҵ�� ���´� �ƴϰ� 4byte�� �������� Ȯ���ȴ�...
		int i = 0;
		while (++i <= 100) {
			if (i%3 != 0) {	//Ex06_countinue������ �ݴ� ��Ȳ
				continue;
			}
			tot += i;	// if������ ��� �� ���� �����Դٴ� ���� �ش� ���� 3�� ������� �ǹ��Ѵ�.
		}
	}


}
