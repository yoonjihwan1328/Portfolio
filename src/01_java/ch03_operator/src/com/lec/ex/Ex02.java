//class명은 반드시 대문자로 시작할 것. 한글로 작성하지 말 것, 특수문자는 _만 사용가능
package com.lec.ex;
//증감연산자 : ++, --
public class Ex02 {
	public static void main(String[] args) {
		int numFirst = 10;	///식별자(n1)는 영어(?)
		numFirst++; // numFirst 값을 하나 증가
		System.out.println(numFirst) ;
		numFirst--;	// numFirst 값을 하나 감소
		System.out.println(numFirst) ;
		++numFirst; // 
		System.out.println(numFirst) ;
		int n = numFirst++ ;
		System.out.printf("n=%d, numFirst=%d\n", n,  numFirst) ;
		System.out.printf("n=%d\n", n) ;	// 내가 추가한 부분. 13th row의 ++는 반영이 안되나?-> numFirst에 반영되지 n에는 아직 반영이 안됨. 근데 다음줄에는 2가 한번에 증가함...ㅠ
		n = ++numFirst;
		System.out.printf("n=%d, numFirst=%d\n", n,  numFirst) ;	//개인적으로 추가한 row
		n = numFirst--;
		System.out.printf("n=%d, numFirst=%d\n", n, numFirst) ;
		
	}

}	// int n = numFirst++; 를 봤을 때 n이 numFirst보다 1 큰 수를 가질 것이라고 예상했는데,
	//	바로 출력을 실시하면 n은 numFirst에 ++가 적용되기 전 값을 반환하고 numFirst는 곧바로 1을 증가시킨 값을 반환한다.
	//	혹은 n = numFirst++ 혹은 numFirst--가 내가 생각하는 정 반대로 작동하는듯.
	//	내가 추가한 부분에 비추어볼 때 할당은 좌->우로 이루어지고 그에 따라 값의 기준도 우항의 변수가 가짐. 우항의 변수값이 확정되고 이후 ++가 앞에 놓여있는지 뒤에 놓여있는지에 맞춰 좌항 n의 값이 결정