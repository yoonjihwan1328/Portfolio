package com.lect.ex12_final;

public class Animal {
	protected int speed;	// 상속받으면 쓸 수 있음, private이면(???) get이용
	public void running() {
		speed += 5;
		System.out.println("뛰고 있어요. 현재속도 : " + speed);
	}
	public final void stop() {	//오버라이드 불가
		speed = 0;
		System.out.println("멈춤");
	}

}
