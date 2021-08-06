package com.lect.ex09_store;
// 김치찌개 5,000	부대찌개 6,000	비빔밥 6,000	순대국 5,000	공기밥 1,000
public class HeadquaterStore {
	private String name;

	public HeadquaterStore(String name) {
		super();	//super클래스의 생성자 HeadquaterStore의 extends가 없으므로 object가 해당됨.
		this.name = name;
	}
		public void kimchi() {
			System.out.println("김치찌개 : 5,000원");
		}
		public void bude() {
			System.out.println("부대찌개 : 6,000원");
		}
		public void bibib() {
			System.out.println("비빔밥 : 6,000원");
		}
		public void sunde() {
			System.out.println("순대국 : 5,000원");
		}
		public void gongibab() {
			System.out.println("공기밥 : 1,000원");
		}
		public String getName() {
			return name;
		}

	

}
