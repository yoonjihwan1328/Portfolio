package com.lect.ex09_store;
// ��ġ� 5,000	�δ�� 6,000	����� 6,000	���뱹 5,000	����� 1,000
public class HeadquaterStore {
	private String name;

	public HeadquaterStore(String name) {
		super();	//superŬ������ ������ HeadquaterStore�� extends�� �����Ƿ� object�� �ش��.
		this.name = name;
	}
		public void kimchi() {
			System.out.println("��ġ� : 5,000��");
		}
		public void bude() {
			System.out.println("�δ�� : 6,000��");
		}
		public void bibib() {
			System.out.println("����� : 6,000��");
		}
		public void sunde() {
			System.out.println("���뱹 : 5,000��");
		}
		public void gongibab() {
			System.out.println("����� : 1,000��");
		}
		public String getName() {
			return name;
		}

	

}
