package com.lec.rect;

public class Rect {
	private int width;
	private int height;
	public int area() {
		return width * height;
	}
// ������ 2��, �޼��� �ϳ��� Ŭ����
	
	//setter, getter�߰�
	public void setWidth(int width) {
		this.width = width;	//�Ű������� ���� int���� �� ��ü(this)�� �Ҵ�
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
