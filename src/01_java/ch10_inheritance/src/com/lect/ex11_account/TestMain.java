package com.lect.ex11_account;

public class TestMain {
	public static void main(String[] args) {
		Account a1 = new Account("111-111", "홍길동", 1000);
		a1.printAccount();	//	Account클래스에 설정이 되어있어서 실행이 가능
		System.out.println(a1);	//객체를 프린트하려고하면 toString메서드가 자동적으로 적용된다.(이클립스는 String으로 출력하려고 노력)
		System.out.println(a1.toString());
		// println(a1)만 입력해도 원하는 형태로 출력이 되길 희망함 -> Account클래스에
		
		Account a10 = new Account("111-111", "홍길동", 1000);
		if(a1==a10) {
			System.out.println("a1객체와 a2객체는 같다");
		}else {
			System.out.println("a1객체와 a2객체는 다르다");	//a1과 a2의 주소가 다르므로 당연히 다르다라고 출력
		}
		if(a1.equals(a10)) {
			System.out.println("a1객체와 a2객체는 같다");
		}else {
			System.out.println("a1객체와 a2객체는 다르다");
		}	// 계좌번호 혹은 이름이 같은 때 같다고 나오려면 어떻게 해야하나?
		int i=10, j=10;
		if(i==j) {
			System.out.println("i와 j는 같다");	//기초데이터의 경우 ==로 간단하게 비교가 가능.
		}
		
		CheckingAccount a2 = new CheckingAccount("222-222", "성춘향", 2000, "1234-5678-9101-1213");
		CheckingAccount a3 = new CreditLineAccount("333-333", "이춘향", 20000, "1111-2222-3333-4444", 10000);
		a1.deposit(9000);
		a1.withdraw(20000);
		a2.withdraw(1000);
		a2.pay("1234-5678-9101-1213", 1000);
		a3.pay("1111-2222-3333-4444", 15000);
				
	}

}
