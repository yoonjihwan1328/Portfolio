package com.lect.ex3_man;

public class ManMain {
	public static void main(String[] args) {
		Man kim = new Man(17, 176, 72, "010-9999-9999");
		Man jung = new Man(163, 71, "010-8888-8888");
		Man lee = new Man(190, 105);
		Man[] student = {kim, lee, jung};
		lee.setPhoneNum("010-5555-5555");
		student[1].setPhoneNum("010-3333-3333"); // Jung.setPhoneNum("010-3333-3333");
		double bmi = kim.calculateBMI();
		if(bmi>24.5) {
			System.out.println(kim.getPhoneNum()+"���� ���̴� �ǰ������� �� �� �Ű���ֱ� �ٶ��ϴ�");
		} else {
			System.out.println(kim.getPhoneNum()+"���� �ǰ��մϴ�");
		}
		
		for(int idx=0; idx<student.length; idx++) {
			bmi = student[idx].calculateBMI();
			if(bmi > 24.5) {
				System.out.println(student[idx].getPhoneNum() + "���� ���̴� �ǰ������� �� �� �Ű���ֱ� �ٶ��ϴ�");
			} else {
				System.out.println(student[idx].getPhoneNum()+ "���� �ǰ��մϴ�");
			}
		} // �� �� ���� �򰡰� ���;� �ϴ� �� �ƴѰ�? �� �� ��/ �� �� ������? --- ���� if���� �� ��, �Ʒ� for���� �� ��, �� �� ���� ����.	
		
	}

}
