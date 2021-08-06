package com.lec.rect;

public class Rect {
	private int width;
	private int height;
	public int area() {
		return width * height;
	}
// 데이터 2개, 메서드 하나의 클래스
	
	//setter, getter추가
	public void setWidth(int width) {
		this.width = width;	//매개변수에 들어온 int값을 내 개체(this)에 할당
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	



}
