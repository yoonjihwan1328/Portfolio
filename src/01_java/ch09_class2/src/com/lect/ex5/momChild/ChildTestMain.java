package com.lect.ex5.momChild;

public class ChildTestMain {
	public static void main(String[] args) {
		Child child1 = new Child("첫째똘만이");
		Child child2 = new Child("둘째똘만이");
		Child child3 = new Child("셋째똘만이");
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		System.out.println("첫째 엄마 지갑 : " + Child.momPouch.money);
		System.out.println("첫째 엄마 지갑 : " + child1.momPouch.money);
		System.out.println("첫째 엄마 지갑 : " + child2.momPouch.money);
		System.out.println("첫째 엄마 지갑 : " + child3.momPouch.money);
	}
// 원랬던 답은 첫 두명은 1000원씩 가져가고 세 번째에는 가져갈 수 없었어야 했는데,
// momPouch가 각각 생성됨으로써(???)... 모두 1000원씩 가져가고 1000원이 남는다.
// momPouch가 공유되길 희망하는데 이 때 사용하는 것도 static!!!
	//제대로 적용 안될 떄는 Child 클래스의 momPouch가 static으로 설정되지 않았을 때.

}
