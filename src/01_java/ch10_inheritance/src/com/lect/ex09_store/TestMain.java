package com.lect.ex09_store;

public class TestMain {
	public static void main(String[] args) {
		HeadquaterStore st = new HeadquaterStore(" - ���� - ");
		System.out.println(st.getName());
		st.kimchi();
		st.bude();
		st.bibib();
		st.sunde();
		st.gongibab();
		StoreNum1 st1 = new StoreNum1("- ���ð� 1ȣ�� -");
		System.out.println(st1.getName());
		st1.kimchi();
		st1.bude();
		st1.bibib();
		st1.sunde();
		st.gongibab();
	}
}
