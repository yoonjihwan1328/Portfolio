package com.lect.ex2_parking;

import constant.Constant;

public class Parking {

		
	private String no;
	private int inTime;
	private int outTime;
//	private final int HOURLYRATE = 2000;	//���������� �ʿ��� ������ ����Ǵ� ���(���ܺ���)�� ��final�� �Է��ϰ� ���̸��� �빮�ڷ� �Է�!!!
											//������ ����� �����l ������ �̷������ �� ��!
	
	public Parking() {} //����ִ�(???) �����ڰ� �ʼ���Ҵ� �ƴ�. ��� ��.
	public Parking(String no, int inTime) {
		this.no = no;
		this.inTime = inTime;
		System.out.println(no+"�� �������");
		System.out.println("�����ð� : " + inTime + "��");
		System.out.println("********************************");		
	}
	
	public void out(int outTime) {	// ���������� : public / private / protected / default
		this.outTime = outTime;
		int fee = (outTime - inTime) * Constant.HOURLYRATE;	//����Ʈ �ؾ� ���� �ȳ�!!
		System.out.println(no+"�� �ȳ��� ������");
		System.out.println("�����ð� : " + inTime + "��");
		System.out.println("�����ð� : " + outTime + "��");
		System.out.println("������� : " + fee + "��");
		System.out.println("**********************************");
	}
// main �Լ��� �߰��ؾ��ϳ�...? ������ �ȵȴ�!!!

}
