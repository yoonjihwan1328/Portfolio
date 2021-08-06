package com.lect.ex11_account;
//new CheckingAccount("111-111", "ȫ�浿", 1000, "1111-2222-3333-4444")
//new CheckingAccount("111-111", "ȫ�浿", "1111-2222-3333-4444")
public class CheckingAccount extends Account {	// Account�� �ִ� ��ҵ��� �� Ŭ�������� ��� ��������.
	private String cardNo;
	public CheckingAccount() {}	//	�Ű������� ���� ������
	public CheckingAccount(String accountNo, String ownerName, int balance, String cardNo) {
		super(accountNo, ownerName, balance);
		this.cardNo = cardNo;
	}
	public void pay(String cardNo, int amount) {
		if(this.cardNo.equals(cardNo)) {	//�ùٸ� ī�� ��ȣ �Է�
			if(getBalance()>=amount) {	//	Balance�� �ٸ� Ŭ������ private�������̹Ƿ� getter(?)�� �̿�
				setBalance(getBalance() - amount);
//				balance -= balance - amount;
				System.out.printf("%s(%s)�� %d���� �����ϼ̽��ϴ�. �ܾ��� %d�� �Դϴ�.",
							getAccountNo(), getOwnerName(), amount, getBalance());
			}else {
			System.out.printf("%s(%s)�� �ܾ�%d������ %d�� ������ �Ұ��մϴ�.",
						getAccountNo(), getOwnerName(), getBalance(), amount);
			}
		}else {
			System.out.println("�ùٸ� ī���ȣ�� �Է��ϼ���");
		}
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
}
