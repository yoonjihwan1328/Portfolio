package com.lec.rect;

public class rect_Main {
	public static void main(String[] args) {
		Rect r1 = new Rect();
		Rect r2 = new Rect();
//클래스 하나에 객체 두 개가 포함된 상태!!!
		System.out.println(r1.area());
		//System.out.println(r1.width); width와 height는 호출이 불가능한가? private이어서 그런가?
		//가로 세로 길이 setting
		System.out.printf("r1의 데이터 : %d %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2의 데이터 : %d %d\n", r2.getWidth(), r2.getHeight());	// private값을 호출할 떄는 게터가 필요한 것? getter의 역할은 무엇인가?
		
		r1.setWidth(195); r1.setHeight(425);
		System.out.print("변경 후\n");
		System.out.printf("r1의 데이터 : %d %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2의 데이터 : %d %d\n", r2.getWidth(), r2.getHeight());
		
		System.out.println(r1.area());
		System.out.println(r2.area());
	}


}
