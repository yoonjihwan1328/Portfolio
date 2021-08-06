package com.lect.ex09_store;
// 주택과 1호점 : 본사로부터 상속 -> 부대찌개 5,000, 순대국 안팔음으로 오버라이드 할 것.
public class StoreNum1 extends HeadquaterStore {
//	만들자마자 에러가 발생한 이유 : HeadquaterStore에 매개변수 없는 생성자가 없기 때문
	public StoreNum1(String name) {
		super(name);
	}
	@Override
	public void bude() {
		System.out.println("부대찌개 5,000원");
	}
	@Override
	public void sunde() {
		System.out.println("순대국 팔지않음");
	}
}
