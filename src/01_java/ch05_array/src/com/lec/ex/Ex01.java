package com.lec.ex;

public class Ex01 {
	public static void main(String[] args) {
		int i = 10; // 변수의 선언과 초기화
		int[] iArr = {10,20,30,40,50};	//1.배열번수 선언과 초기화 : iArr이라는 변수가 int[] type으로 선언됨. + {10,20,30,40,50}값으로 초기값이 설정
		System.out.println(iArr[1]);	//배열은 index로 접근(index:0~4)
		iArr[4] = 90;
		System.out.println(iArr[4]);
		
		System.out.print(iArr[0]+"\t");
		System.out.print(iArr[1]+"\t");
		System.out.print(iArr[2]+"\t");
		System.out.print(iArr[3]+"\t");
		System.out.print(iArr[4]+"\n");
		
		for(int idx=0 ; idx<iArr.length ; idx++) {	//iArr.length : 배열의 크기라고 부름
			System.out.println(iArr[idx]);
		}
		//***********************************************************************//
		int i2;
		i2 = 10;
		int[] iArr2 = new int[5];	// 2.배열변수 선언과 배열메모리 공간확보(배열 객체 생성), ---new는 메모리 공간을 확보하는 명령어, int 5공간 = 20byte가 잡힘. 
		System.out.println(iArr2[4]);	//초기값을 설정하지 않은 경우 0으로 초기화 되어있음.(double = 0.0, boolean = false)
		for(int idx=0; idx<iArr2.length; idx++) {	//일반 for문을 이용한 배열접근
			System.out.println("iArr2배열의" + idx + "번째값 : " + iArr[idx]);
		}
		
		int[] iArr3 = null;	// 3.배열변수만 선언(배열 공간도 확보가 안되있음. 초기값도 설정 안됨), = null은 생략해도 됨. iArr3 배열을 아직 사용할 수 없는 상태임.
		iArr3 = new int[6];	// 0 0 0 0 0 0
		//배열은 공간이 설정되면 이후 변경이 불가하다. <- 7번째 값을 pop, append나 insert등이 불가능하나든 말인가?????
		for(int idx=0; idx<iArr3.length ; idx++) {
			System.out.println(iArr3[idx]);
		}
		
		//확장 for문을 이용
		
		int[] iArr4;
		iArr4 = new int[3];
		///int[] iArr4 = {100, 200, 300}; //오류님
		iArr4[0]=100;
		for(int temp : iArr4) {
			System.out.println(temp);
		}// temp값이 자동 증가하는 것도 아니고 무엇을 의도한거지? 초기값이 0으로 자동으로 설정되고 자동 증가하는듯? for확장구문의 장점인건가?
		//확장 구문은 배열의 값을 변경할 수 없다
		
		for(int idx=0 ; idx<iArr4.length;idx++) {
			iArr4[idx]=999;
			System.out.println(iArr[idx]);
		}
	}
}
