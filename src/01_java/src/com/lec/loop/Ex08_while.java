package com.lec.loop;

/*i�� 1�� �� �������� 1�̴�
..
i�� 10�϶� �������� 55�̴�*/
public class Ex08_while {
	public static void main(String[] args) {
		/*
		 * int tot = 0; for(int i=1 ; i<11 ; i++) { tot += i ; // tot=tot+i
		 * System.out.printf("i�� %d�϶� �������� %d�̴�\n", i, tot); }
		 */
		int tot = 0 ;
		for(int i=1 ; i<11 ; i++) {
			tot += i; // tot = tot+i
			System.out.printf("i�� %d�϶� �������� %d�̴�\n",  i, tot);
		}
	}

}
