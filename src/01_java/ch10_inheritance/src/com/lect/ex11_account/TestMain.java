package com.lect.ex11_account;

public class TestMain {
	public static void main(String[] args) {
		Account a1 = new Account("111-111", "ȫ�浿", 1000);
		a1.printAccount();	//	AccountŬ������ ������ �Ǿ��־ ������ ����
		System.out.println(a1);	//��ü�� ����Ʈ�Ϸ����ϸ� toString�޼��尡 �ڵ������� ����ȴ�.(��Ŭ������ String���� ����Ϸ��� ���)
		System.out.println(a1.toString());
		// println(a1)�� �Է��ص� ���ϴ� ���·� ����� �Ǳ� ����� -> AccountŬ������
		
		Account a10 = new Account("111-111", "ȫ�浿", 1000);
		if(a1==a10) {
			System.out.println("a1��ü�� a2��ü�� ����");
		}else {
			System.out.println("a1��ü�� a2��ü�� �ٸ���");	//a1�� a2�� �ּҰ� �ٸ��Ƿ� �翬�� �ٸ��ٶ�� ���
		}
		if(a1.equals(a10)) {
			System.out.println("a1��ü�� a2��ü�� ����");
		}else {
			System.out.println("a1��ü�� a2��ü�� �ٸ���");
		}	// ���¹�ȣ Ȥ�� �̸��� ���� �� ���ٰ� �������� ��� �ؾ��ϳ�?
		int i=10, j=10;
		if(i==j) {
			System.out.println("i�� j�� ����");	//���ʵ������� ��� ==�� �����ϰ� �񱳰� ����.
		}
		
		CheckingAccount a2 = new CheckingAccount("222-222", "������", 2000, "1234-5678-9101-1213");
		CheckingAccount a3 = new CreditLineAccount("333-333", "������", 20000, "1111-2222-3333-4444", 10000);
		a1.deposit(9000);
		a1.withdraw(20000);
		a2.withdraw(1000);
		a2.pay("1234-5678-9101-1213", 1000);
		a3.pay("1111-2222-3333-4444", 15000);
				
	}

}
