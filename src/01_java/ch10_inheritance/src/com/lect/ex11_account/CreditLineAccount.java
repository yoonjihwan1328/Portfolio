package com.lect.ex11_account;
//	new CreditLineAccount("11-11", "홍길동", 1000, "1111-2222-3333-4444", 2000);
//new CreditLineAccount("11-11", "홍길동", "1111-2222-3333-4444", 2000);
public class CreditLineAccount extends CheckingAccount{
	private int creditLine;	// 카드한도
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine = creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int balance, int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine = creditLine;
	}
	//kim = new CreditLineAccount("11-11","홍길동", 1000, "1111-2222-3333-4444", 2000);
	//kim.pay("1111-2222-3333-4444", 1500)
	@Override
	public void pay(String cardNo, int amount) {
		if(getCardNo().equals(cardNo)) {	//올바른 카드번호 입력
			if(creditLine>=amount) {	//pay가능
				creditLine -= amount;
				System.out.printf("%s님 수정된 현재 한도액 : %d\n", 
								getOwnerName(), creditLine);
			}else {	//한도초과로 pay불가
				System.out.printf("%s님 현재 한도 %d원으로 한도초과됨");
			}
		}else {	// 카드번호 입력 오류인 경우
			System.out.println("카드번호가 틀립니다.");
		}
	}

}
