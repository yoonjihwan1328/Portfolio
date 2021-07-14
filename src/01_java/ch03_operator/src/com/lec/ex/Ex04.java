package com.lec.ex;
// 논리연산자 : &&(AND), ||(OR), !
public class Ex04 {
	public static void main(String[] args) {
		int i=1, j=10, h=10 ;
		System.out.println("(i<j) && (++j>h) : " + ((i<j) && (++j>h))) ;
		System.out.println("(i<j) && (++j>h) : " +((i<j) && (++j>h))) ;
		System.out.println("j=" + j) ;
		System.out.println("(i>j) && (++j>h) : " +((i>j) && (++j>h))) ;
		System.out.println("j=" + j) ;	// i>j가 false였기 때문에 ++j가 수행되지 않았다.(보다 정확히는 전체 등식이 false이기에 후속 연산이 수행되지 않음)
		System.out.println("OR(||)") ;
		System.out.println("(i>j) || (++j>h) : " +((i>j) || (++j>h))) ;
		System.out.println("j=" + j) ;	// OR연산은 앞이 false면 뒤의 연산도 확인해야하기 때문에 뒤의 연산이 실행됨
		System.out.println("(i<j) || (++j>h) : " +((i<j) || (++j>h))) ;
		System.out.println("j=" + j) ;	// OR연산은 앞이 true이면 뒤의 연산을 확인할 필요가 없기 때문에 뒤의 연산이 실행되지 않음!!!
		///★OR연산의 앞 ture/false 여부에 따라 마치 if문 처럼 활용이 가능하기도 하다(javascript) 
	}

}
