package com.lec.car;

import java.util.Scanner;

public class CarMain {
	public static void main(String[] args) {
		
		Car myPorsche = new Car();	// car�� ���ʵ����� Ÿ���� �ƴϱ� ������ �ּҰ� ���. myPorsche�� Car���̴�. �׷��� Car�� ����ڰ� ���� Ŭ�����̴�.
//		myPorsche.color = "����";
		myPorsche.setColor("����");
		//System.out.println(myPorsche.color);	// private�� ���¿����� �̷��Ե� �۵��� ���ϴµ�. getter �ʿ�
		System.out.println(myPorsche.getColor());
		myPorsche.drive();	// �ü� 60�� �����ϴ� ���¸� �ǽ�
		myPorsche.park();
		myPorsche.race();
//		Car yourPorsche;	// yourProsche�� ���� ---�� ���°� �ƴ�.
		Car yourPorsche = new Car();
//		yourPorsche.color = "grey"; String Color�� Private�̱� ������ .color ����� ������ ��ȯ�ϰ� �Ǵµ�???
//							Car Ŭ���� �ȿ����� color = "grey"�� ���� ������ �� �־���.
//							�ٸ� Ŭ���������� ���.color ������� �Է��ؾ��ϳ�????? ������ �׸����� �ȵ�(Private�̱� ����)
		yourPorsche.setColor("grey");
		//System.out.println("�� ������ ���� : " + myPorsche.color);
		System.out.println("�� ������ ���� : " + myPorsche.getColor());
		//System.out.println("�� ������ ���� : " + yourPorsche.color);	// private�� ���¿����� �̷��Ե� �۵��� ���ϴµ�. getter �ʿ�
		System.out.println("�� ������ ���� : " + yourPorsche.getColor());	//()�� �Ⱦ��� ����variable�̰� ()�� �ٿ��� �޼��尡 ��!
// class�� �ؾ Ʋ�̰� ��ü�� �ؾ�̴�.
		
	}



}
