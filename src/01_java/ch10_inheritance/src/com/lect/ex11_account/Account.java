package com.lect.ex11_account;

public class Account {
	private String accountNo;	//���¹�ȣ
	private String ownerName;	//������
	private int balance;		//�ܾ�
	public Account() {}			//����Ʈ ������ : �Ű����� ���� ������
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
	public void deposit(int money) {	//�ܾ��� return�ϰ� ������ int, �Աݾ��� �����ܾ׿� �߰��� �Ѵٸ� void
		balance += money;
		System.out.printf("%s(%s)�� %d���� �Ա��ϼ̽��ϴ�. �ܾ��� %d�� �Դϴ�.\n",
						ownerName, accountNo, money, balance);
	}public void withdraw(int money) {	//����
		if(balance >= money) {
			balance -= money;
			System.out.printf("%s(%s)�� %d�� �����Ͽ� �ܾ� %d\n",
						ownerName, accountNo, money, balance);
		}else {
			System.out.printf("%s(%s)�� �ܾ�%d������ %d�� ���� �Ұ�\n",
						ownerName, accountNo, balance, money);
		}
	}
	public void printAccount() {
		System.out.printf("%s(%s)�� �ܾ� : %d��\n", ownerName, accountNo, balance);
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s(%s)�� �ܾ� : %d��\n", ownerName, accountNo, balance);
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
