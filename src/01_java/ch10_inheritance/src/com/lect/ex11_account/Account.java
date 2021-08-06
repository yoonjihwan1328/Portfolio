package com.lect.ex11_account;

public class Account {
	private String accountNo;	//계좌번호
	private String ownerName;	//예금주
	private int balance;		//잔액
	public Account() {}			//디폴트 생성자 : 매개변수 없는 생성자
	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}
	public Account(String accountNo, String ownerName, int balance) {
		super();
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
	public void deposit(int money) {	//잔액을 return하고 싶으면 int, 입금액을 통장잔액에 추가만 한다면 void
		balance += money;
		System.out.printf("%s(%s)님 %d원을 입금하셨습니다. 잔액은 %d원 입니다.\n",
						ownerName, accountNo, money, balance);
	}public void withdraw(int money) {	//인출
		if(balance >= money) {
			balance -= money;
			System.out.printf("%s(%s)님 %d원 인출하여 잔액 %d\n",
						ownerName, accountNo, money, balance);
		}else {
			System.out.printf("%s(%s)님 잔액%d원으로 %d원 인출 불가\n",
						ownerName, accountNo, balance, money);
		}
	}
	public void printAccount() {
		System.out.printf("%s(%s)님 잔액 : %d원\n", ownerName, accountNo, balance);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s(%s)님 잔액 : %d원\n", ownerName, accountNo, balance);
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}

}
