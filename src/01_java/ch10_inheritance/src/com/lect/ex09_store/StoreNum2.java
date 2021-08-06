package com.lect.ex09_store;
//대학가 2호점 : 본사로부터 상속 후 부대찌개 5,000 비빔밥 5,000 공기밥 무료로 오버라이드하시오
public class StoreNum2 extends HeadquaterStore {
	public StoreNum2(String name) {
		super(name);
	}
	@Override
	public void bude() {
		System.out.println("부대찌개 5,000원");
	}
	@Override
	public void bibib() {
		System.out.println("비빔밥 5,000원");
	}
	@Override
	public void gongibab() {
		System.out.println("공기밥 무료");
	}

}
