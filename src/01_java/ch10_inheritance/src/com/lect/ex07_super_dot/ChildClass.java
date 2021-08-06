package com.lect.ex07_super_dot;
//	super 부모클래스의
public class ChildClass extends ParentClass_____ {
	private String cStr = "자식클래스";
	public ChildClass() {
		System.out.println("자식생성자");
	}
	public void getMamiName() {
		System.out.println("이쁜 아주 이쁜");
		super.getMamiName();
	}
}
