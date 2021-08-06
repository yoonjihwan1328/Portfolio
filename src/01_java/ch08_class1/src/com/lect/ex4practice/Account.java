package com.lect.ex4practice;
//package com.lect.ex4practice;
// 은행계좌(Account) 클래스 설계
// 데이터(속성) : 계좌번호(accountNo), 예금주(ownerName), 잔액(balance)
// 기능(메소드) : 예금하다(deposit), 인출하다(withdraw), 정보를 출력하다(info)

public class Account {
	private String accountNo;
	private String ownerName;
	private int balance;
	
	public Account() {}
	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}
	public Account(String accountNo, String ownerName, int balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
	

}
