//

package com.lect.ex5.boxorrect;
//�����ʹ� private���� ����, �������Լ��� return type�� ����.
//�޼ҵ�, setter, getter�� �����ؾ���.
public class BoxOrRect {
	private int width;
	private int height;
	private int depth;
	private int volume;	//���ǳ� ����

	public BoxOrRect() {}	//�Ű������� ���� ����Ʈ �������Լ�, Ŭ������� �����ؾ���.
	public BoxOrRect(int width, int height) {
		this.width = width;
		this.height = height;
		// depth = 0;
		// volume = width*height;
	}
	public BoxOrRect(int width, int height, int depth) { //Ŭ������� ����, return type�� ����.
		this.width = width;
		this.height = height;
		this.depth = depth;
//		volume = width * height * depth ;
	}
// Main�Լ��� calV�޼��尡 box.calV();, rect.calV(); �� ���� ���·� ���� ���̴�.
// ���� �޼��带 ����� �� �ְ� ��������� ��.
	public void calV() {	// return type�� void
		if (depth !=0) {
		volume = width * height * depth;
		} else {
		volume = width * height;
		}
	}
//box.getVolume�� 300���� ��ȯ�Ǿ����.
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
		
//	getter, setter �ڵ��ϼ�
//	�� ���� ���콺 ��Ŭ�� - Source - Generate Getters and Setters 
	
	
// calV�� �κ��� �����ڵ� �ڵ��ϼ� ����� ����!!!! �ݵ�� �������Լ��� ��� ������� �����ϰ� ����ؾ���
// ����� ���콺 ��Ŭ�� - Source - Generate Constructors from Superclass
	
//	����� ���콺 ��Ŭ�� - Source - Generate Constructors using fields
}
