package com.lec.car;
//데이터(private), 메서드(public), setter, getter private을 활용할 수 있도록
public class Car {
	private String color;	// 데이터는 private으로 설정. 외부에서는 변경, 활용할 수 있다 (근데 아무런 기록을 안하면 알아서 private으로 기본값을 갖는것 아니었나?) 
	private int cc;
	private int speed;	//속성 or 데이터
// speed에 int타입 부여. drive()에 voin타입(?)부여...public과  private 바로 다음에 위치...
	public void drive() {
		speed = 60;
		System.out.println("운전한다. 지금속도 " + speed);
	}
	public void park() {
		speed = 0;
		System.out.println("주차한다. 지금속도 " + speed);
	} 
	
	public void race() {
		speed = 120;
		System.out.println("레이싱 한다. 지금속도" + speed);		
	}
	//	setter(color, cc, speed)
	public void setColor(String color) {
		this.color = color;	//this : '내 객체의'
	}
	public void setCs(int cc) {
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	// getter(color, cc, speed)
	public String getColor() { 	
	//매개변수 필요없음. setting할게 아님. myPorsche.getcolor 형식으로 불러올 것임. return을 ("빨강")으로 받아야함. String!!
		return color;
	}
	public int getCc() {
	//cc값이 숫자이므로 int!
		return cc;
	}
	public int getSpeed() {
		return speed;
	}
}
