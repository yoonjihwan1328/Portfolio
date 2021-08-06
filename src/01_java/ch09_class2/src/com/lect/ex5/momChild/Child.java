package com.lect.ex5.momChild;
// Child first = new Child("첫째똘만이");
// first.takeMony(1000);
public class Child {
	private String name;
//	MomPouch momPouch = new MomPouch();
	static MomPouch momPouch = new MomPouch();	//이탤릭체는 static!!! 데이터영역에 발생하지 않고, 개체 안에 있지 않고 class영역에 저장. ---뭐라뭐라...
	//first.momPouch.money가 2000 <--- 무슨뜻?
	public Child(String name) {
		this.name = name;
	}
	public void takeMoney(int money) {
		if(momPouch.money >= money) {
			momPouch.money = momPouch.money - money;	// momPouch.money -= money;
			System.out.println(name + "가 " + money +"만큼 가져가서 엄마돈은 " + momPouch.money);
		}else {
			System.out.println(name + "가 돈을 못받음, 엄마돈은 " + momPouch.money);
		}
	}

}
