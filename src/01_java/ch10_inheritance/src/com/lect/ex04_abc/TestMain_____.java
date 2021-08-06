package com.lect.ex04_abc;

public class TestMain_____ {
	public static void main(String[] args) {
		S[] sArr = {new A(), new B(), new C()};
		S s = new S();
//		A a = new A();
		S a = new A();
		// A s = new S(); ºÒ°¡!!!
		S b = new B();
		S c = new C();
		S[] arr = {a, b ,c};
		System.out.println(c.toString());
		System.out.println(c);
		
		
	}

}
