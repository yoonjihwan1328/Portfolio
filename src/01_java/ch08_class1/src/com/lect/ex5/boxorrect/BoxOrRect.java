//

package com.lect.ex5.boxorrect;
//데이터는 private으로 설정, 생성자함수는 return type이 없음.
//메소드, setter, getter를 포함해야함.
public class BoxOrRect {
	private int width;
	private int height;
	private int depth;
	private int volume;	//부피나 넓이

	public BoxOrRect() {}	//매개변수가 없는 디폴트 생성자함수, 클래스명과 동일해야함.
	public BoxOrRect(int width, int height) {
		this.width = width;
		this.height = height;
		// depth = 0;
		// volume = width*height;
	}
	public BoxOrRect(int width, int height, int depth) { //클래스명과 동일, return type이 없음.
		this.width = width;
		this.height = height;
		this.depth = depth;
//		volume = width * height * depth ;
	}
// Main함수에 calV메서드가 box.calV();, rect.calV(); 와 같은 형태로 쓰일 것이다.
// 따라서 메서드를 사용할 수 있게 생성해줘야 함.
	public void calV() {	// return type이 void
		if (depth !=0) {
		volume = width * height * depth;
		} else {
		volume = width * height;
		}
	}
//box.getVolume이 300으로 반환되어야함.
	public int getVolume() {
		return volume;
	}
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public int getDepth() {
		return depth;
	}
		
//	getter, setter 자동완성
//	빈 공간 마우스 우클릭 - Source - Generate Getters and Setters 
	
	
// calV윗 부분인 생성자도 자동완성 기능이 있음!!!! 반드시 생성자함수가 어떻게 생겼는지 이해하고 사용해야함
// 빈공간 마우스 우클릭 - Source - Generate Constructors from Superclass
	
//	빈공간 마우스 우클릭 - Source - Generate Constructors using fields
}
