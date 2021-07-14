package com.lec.ex;

public class Ex021 {
	public static void main(String[] args) {
		int n1 = 10;
		int n2;
		n2 = n1++;
		System.out.printf("1. n1 = %d, n2 = %d\n", n1, n2);	
							// n2에 (n1+1)값이 배정될 줄 알았음. n2에는 n1값이 배정되고 n1은 +1이 적용되여 출력됨
		
		System.out.printf("1. n1 = %d, n2 = %d\n", n1, n2);	
		int n3 = 10;
		System.out.printf("2. n3 = %d\n", n3++);
		System.out.printf("3. n3 = %d\n", n3);
		int n4=10;
		System.out.printf("4. n4 = %d\n", --n4);
		System.out.printf("5. n4 = %d\n", n4);
				
	}

}
