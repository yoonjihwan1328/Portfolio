package com.lec.loop;
// 10. 9. 8. 7 6. 5. 4. 3. 2. 1.
public class Ex07_while {
	public static void main(String[] args) {
		/*
		 * for(int i=10; i>=1; i--) { System.out.print(i + ". "); }
		 */
		int i = 10;
		while(i>=1) {	//(eg: ������ i>=100���� �����ȴٸ� �� ���� ������� ����)
			System.out.print(i + ". ");
			i--;	// ���� �ݺ������� ����ؾ� �ϴµ� �� ���̳� �ݺ��ؾ� �� �� �𸦶�, eg) file�� ������ؾ� �� ��			
		}
	}

	
}
