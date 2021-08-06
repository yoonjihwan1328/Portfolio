package com.lect.ex11_account;
//	new CreditLineAccount("11-11", "ȫ�浿", 1000, "1111-2222-3333-4444", 2000);
//new CreditLineAccount("11-11", "ȫ�浿", "1111-2222-3333-4444", 2000);
public class CreditLineAccount extends CheckingAccount{
	private int creditLine;	// ī���ѵ�
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine = creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int balance, int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine = creditLine;
	}
	//kim = new CreditLineAccount("11-11","ȫ�浿", 1000, "1111-2222-3333-4444", 2000);
	//kim.pay("1111-2222-3333-4444", 1500)
	@Override
	public void pay(String cardNo, int amount) {
		if(getCardNo().equals(cardNo)) {	//�ùٸ� ī���ȣ �Է�
			if(creditLine>=amount) {	//pay����
				creditLine -= amount;
				System.out.printf("%s�� ������ ���� �ѵ��� : %d\n", 
								getOwnerName(), creditLine);
			}else {	//�ѵ��ʰ��� pay�Ұ�
				System.out.printf("%s�� ���� �ѵ� %d������ �ѵ��ʰ���");
			}
		}else {	// ī���ȣ �Է� ������ ���
			System.out.println("ī���ȣ�� Ʋ���ϴ�.");
		}
	}

}
