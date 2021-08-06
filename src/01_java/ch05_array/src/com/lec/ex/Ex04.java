package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) {
		int[] arr = {1,2,3};	// 1차원배열
		System.out.println(arr[1]);
		int[][] test = {{10,20,30}
						,{40,50,60}};	//2차원배열, 별로 안쓰임. python 딥러닝에서 사용. 2차원배열을 쓸때는 데이터베이스에 넣음. 
		test[0][2] = 300;
	
		//다차원 배열 test출력,	나는 System.out.println(test)로 시도했었음.ㅋ;
		
		for (int i=0; i<test.length ; i++) {
			//test[0], test[1], ...
			for(int j=0; j<test[i].length; j++) {
				System.out.printf("test[%d][%d] = %d\n", 
										i, j, test[i][j]);
			}
		}
	}
}
