package com.lect.ex11_account;
//new CheckingAccount("111-111", "홍길동", 1000, "1111-2222-3333-4444")
//new CheckingAccount("111-111", "홍길동", "1111-2222-3333-4444")
public class CheckingAccount extends Account {	// Account에 있는 요소들이 이 클래스에서 사용 가능해짐.
	private String cardNo;
	public CheckingAccount() {}	//	매개변수가 없는 생성자
	public CheckingAccount(String accountNo, String ownerName, int balance, String cardNo) {
		super(accountNo, ownerName, balance);
		this.cardNo = cardNo;
	}
	public void pay(String cardNo, int amount) {
		if(this.cardNo.equals(cardNo)) {	//올바른 카드 번호 입력
			if(getBalance()>=amount) {	//	Balance는 다른 클래스의 private데이터이므로 getter(?)를 이용
				setBalance(getBalance() - amount);
//				balance -= balance - amount;
				System.out.printf("%s(%s)님 %d원을 지불하셨습니다. 잔액은 %d원 입니다.",
							getAccountNo(), getOwnerName(), amount, getBalance());
			}else {
			System.out.printf("%s(%s)님 잔액%d원으로 %d원 지불이 불가합니다.",
						getAccountNo(), getOwnerName(), getBalance(), amount);
			}
		}else {
			System.out.println("올바른 카드번호를 입력하세요");
		}
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
}
