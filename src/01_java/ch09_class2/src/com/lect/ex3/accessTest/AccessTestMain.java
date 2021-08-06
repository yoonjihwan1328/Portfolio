package com.lect.ex3.accessTest;
//AccessTest 클래스에서 만든 메서드들의 활용이 외부에서 가능한지 확인.
public class AccessTestMain {
	public static void main(String[] args) {
		AccessTest obj = new AccessTest(); // 앞에서 우리는 ...를 생성 안했었는데? -> 컴파일러가 (){}를 생성해 놓은 것
//		System.out.println(obj.privateMember);	
		System.out.println(obj.defaultMember);
		System.out.println(obj.protectedMember);
		System.out.println(obj.publicMember);
		//private인 경우에만 같은 패키지 내 다른 클래스에서 실행이 안된다.
	
//		obj.privateMethod();
		obj.defaultMethod();
		obj.protectedMethod();
		obj.publicMethod();
	}

}
