package com.lec.loop;

public class Ex11_1_DoWhile {
	public static void main(String[] args) {
		int cnt = 0;
		do {
			System.out.print(cnt + ", ");;
			if(cnt==10)break;
			cnt++;
		}while(true);
	}
}
// do {} �ȿ� ����� ������ �ش� {}�� ������� �۵����� ����. ����  while() �������� ����� �� ����.
//int temp�� �߰��ϰ� while�ȿ� temp������ �ο��ߴµ� �޾����� ����.