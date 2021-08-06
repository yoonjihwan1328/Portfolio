package com.lect.ex3_man;
// Man Kim = New Man(17, 176, 72, "010-9999-9999");
// Man Lee = New Man(163, 71, "010-8888-8888");
// Man Jung = New Man(190, 105);
public class Man {
	private int age;
	private int height;
	private int weight;
	private String phoneNum;
	
	public Man() {}	//����Ʈ ������, ���� �۾��� �̷��������...? ������ Man�̶�� Ŭ������ �������...������ ������ ��� �ָӴϷμ� �����ϴ� �� ����
	// �޼ҵ尡 �����Ǵ�...?
	public Man(int height, int weight) {
		this.height = height;
		this.weight = weight;
	}
	public Man(int height, int weight, String phoneNum) {
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
	}
	public Man(int age, int height, int weight, String phoneNum) {
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
	}
	public double calculateBMI() {
		double result = weight / ((height*0.01) * (height*0.01));
		return result;
	}
	
	public void setAge(int age) {
//   return type����, setter�̸�(������Ÿ�� �����̸�)
		this.age = age;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public int getAge() {
		return age;
	}
	public int getHeight() {
		return height;
	}
	public int getWeight() {
		return weight;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
}
