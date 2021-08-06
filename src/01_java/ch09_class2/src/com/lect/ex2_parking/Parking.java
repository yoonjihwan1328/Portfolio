package com.lect.ex2_parking;

import constant.Constant;

public class Parking {

		
	private String no;
	private int inTime;
	private int outTime;
//	private final int HOURLYRATE = 2000;	//유지보수가 필요할 것으로 예상되는 상수(종단변수)는 ★final을 입력하고 ★이름을 대문자로 입력!!!
											//밖으로 빼내어서 별도릐 관리가 이루어지레 할 것!
	
	public Parking() {} //비어있는(???) 생성자가 필수요소는 아님. 없어도 됨.
	public Parking(String no, int inTime) {
		this.no = no;
		this.inTime = inTime;
		System.out.println(no+"님 어서오세요");
		System.out.println("입차시간 : " + inTime + "시");
		System.out.println("********************************");		
	}
	
	public void out(int outTime) {	// 접근제한자 : public / private / protected / default
		this.outTime = outTime;
		int fee = (outTime - inTime) * Constant.HOURLYRATE;	//임폴트 해야 오류 안남!!
		System.out.println(no+"님 안녕히 가세요");
		System.out.println("입차시간 : " + inTime + "시");
		System.out.println("출차시간 : " + outTime + "시");
		System.out.println("주차요금 : " + fee + "원");
		System.out.println("**********************************");
	}
// main 함수를 추가해야하나...? 실행이 안된다!!!

}
