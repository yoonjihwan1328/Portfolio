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
			System.out.println(kim.getPhoneNum()+"님은 비만이니 건강관리에 좀 더 신경써주기 바랍니다");
		} else {
			System.out.println(kim.getPhoneNum()+"님은 건강합니다");
		}
		
		for(int idx=0; idx<student.length; idx++) {
			bmi = student[idx].calculateBMI();
			if(bmi > 24.5) {
				System.out.println(student[idx].getPhoneNum() + "님은 비만이니 건강관리에 좀 더 신경써주기 바랍니다");
			} else {
				System.out.println(student[idx].getPhoneNum()+ "님은 건강합니다");
			}
		} // 세 명에 대한 평가가 나와야 하는 것 아닌가? 왜 두 명/ 두 명만 나오지? --- 위에 if에서 한 명, 아래 for에서 세 명, 총 네 명이 맞음.	
		
	}

}
