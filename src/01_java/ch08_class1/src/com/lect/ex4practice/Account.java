package com.lect.ex4practice;
//package com.lect.ex4practice;
// �������(Account) Ŭ���� ����
// ������(�Ӽ�) : ���¹�ȣ(accountNo), ������(ownerName), �ܾ�(balance)
// ���(�޼ҵ�) : �����ϴ�(deposit), �����ϴ�(withdraw), ������ ����ϴ�(info)

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
