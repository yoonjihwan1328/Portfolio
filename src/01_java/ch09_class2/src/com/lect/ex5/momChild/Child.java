package com.lect.ex5.momChild;
// Child first = new Child("ù°�ʸ���");
// first.takeMony(1000);
public class Child {
	private String name;
//	MomPouch momPouch = new MomPouch();
	static MomPouch momPouch = new MomPouch();	//���Ÿ�ü�� static!!! �����Ϳ����� �߻����� �ʰ�, ��ü �ȿ� ���� �ʰ� class������ ����. ---���󹹶�...
	//first.momPouch.money�� 2000 <--- ������?
	public Child(String name) {
		this.name = name;
	}
	public void takeMoney(int money) {
		if(momPouch.money >= money) {
			momPouch.money = momPouch.money - money;	// momPouch.money -= money;
			System.out.println(name + "�� " + money +"��ŭ �������� �������� " + momPouch.money);
		}else {
			System.out.println(name + "�� ���� ������, �������� " + momPouch.money);
		}
	}

}
