package com.lec.car;
//������(private), �޼���(public), setter, getter private�� Ȱ���� �� �ֵ���
public class Car {
	private String color;	// �����ʹ� private���� ����. �ܺο����� ����, Ȱ���� �� �ִ� (�ٵ� �ƹ��� ����� ���ϸ� �˾Ƽ� private���� �⺻���� ���°� �ƴϾ���?) 
	private int cc;
	private int speed;	//�Ӽ� or ������
// speed�� intŸ�� �ο�. drive()�� voinŸ��(?)�ο�...public��  private �ٷ� ������ ��ġ...
	public void drive() {
		speed = 60;
		System.out.println("�����Ѵ�. ���ݼӵ� " + speed);
	}
	public void park() {
		speed = 0;
		System.out.println("�����Ѵ�. ���ݼӵ� " + speed);
	} 
	
	public void race() {
		speed = 120;
		System.out.println("���̽� �Ѵ�. ���ݼӵ�" + speed);		
	}
	//	setter(color, cc, speed)
	public void setColor(String color) {
		this.color = color;	//this : '�� ��ü��'
	}
	public void setCs(int cc) {
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	// getter(color, cc, speed)
	public String getColor() { 	
	//�Ű����� �ʿ����. setting�Ұ� �ƴ�. myPorsche.getcolor �������� �ҷ��� ����. return�� ("����")���� �޾ƾ���. String!!
		return color;
	}
	public int getCc() {
	//cc���� �����̹Ƿ� int!
		return cc;
	}
	public int getSpeed() {
		return speed;
	}
}
