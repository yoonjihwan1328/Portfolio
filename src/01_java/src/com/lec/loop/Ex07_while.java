package com.lec.loop;
// 10. 9. 8. 7 6. 5. 4. 3. 2. 1.
public class Ex07_while {
	public static void main(String[] args) {
		/*
		 * for(int i=10; i>=1; i--) { System.out.print(i + ". "); }
		 */
		int i = 10;
		while(i>=1) {	//(eg: 조건이 i>=100으로 설정된다면 한 번도 실행되지 않음)
			System.out.print(i + ". ");
			i--;	// 내가 반복업무를 명령해야 하는데 몇 번이나 반복해야 할 지 모를때, eg) file을 입출력해야 할 때			
		}
	}

	
}
