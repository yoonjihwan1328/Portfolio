package com.lec.car;

import java.util.Scanner;

public class CarMain {
	public static void main(String[] args) {
		
		Car myPorsche = new Car();	// car는 기초데이터 타입이 아니기 때문에 주소가 담김. myPorsche는 Car형이다. 그런데 Car는 사용자가 만든 클래스이다.
//		myPorsche.color = "빨강";
		myPorsche.setColor("빨강");
		//System.out.println(myPorsche.color);	// private인 상태에서는 이렇게도 작동을 안하는듯. getter 필요
		System.out.println(myPorsche.getColor());
		myPorsche.drive();	// 시속 60에 운전하는 상태를 실시
		myPorsche.park();
		myPorsche.race();
//		Car yourPorsche;	// yourProsche는 아직 ---인 상태가 아님.
		Car yourPorsche = new Car();
//		yourPorsche.color = "grey"; String Color가 Private이기 때문에 .color 명령이 오류를 반환하게 되는듯???
//							Car 클래스 안에서는 color = "grey"와 같이 변경할 수 있었음.
//							다른 클래스에서는 대상.color 방식으로 입력해야하나????? 지금은 그마저도 안됨(Private이기 때문)
		yourPorsche.setColor("grey");
		//System.out.println("내 포르쉐 색상 : " + myPorsche.color);
		System.out.println("내 포르쉐 색상 : " + myPorsche.getColor());
		//System.out.println("네 포르쉐 색상 : " + yourPorsche.color);	// private인 상태에서는 이렇게도 작동을 안하는듯. getter 필요
		System.out.println("네 포르쉐 색상 : " + yourPorsche.getColor());	//()를 안쓰면 변수variable이고 ()를 붙여야 메서드가 됨!
// class는 붕어빵 틀이고 객체는 붕어빵이다.
		
	}



}
