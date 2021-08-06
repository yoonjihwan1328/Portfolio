package com.lect.ex3.accessTest;

public class AccessTest {
//데이터
	private int privateMember;	// 같은 클래스 내에서만 사용가능
	int defaultMember;			// 디폴트 접근제한 : 같은 패키지에서만 가능
	protected int protectedMember;	// 같은 패키지와 상속받은 클래스에서 가능
	public int publicMember;		// 외부에서 아무나
//메소드
	private void privateMethod() {
		System.out.println("private 메소드");
	}
	void defaultMethod() {
		System.out.println("default 메소드");
	}
	protected void protectedMethod() {
		System.out.println("protected 메소드");
	}
	public void publicMethod() {
		System.out.println("public 메소드");
	}// 예시들은 매개변수(파라미터)를 요구하지 않으며 return 값을 반환하지 않는 예시들인듯.
}
