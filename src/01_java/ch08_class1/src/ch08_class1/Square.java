//��Ű����, Ŭ������, ������, #�������Լ�#, �޼ҵ�, setter&getter
//main*() ; Square s new Square() �� ���·� main�Լ����� ��ü�� ��������� ����ȴ�.(Square �������Լ��� ȣ��Ǵ� �ñ�!)
//			Square s1 = new Square(10);	�� ���� ������ ������ �Լ��� �Ű������� �������̸����� ���� ���������ϴ�.
// �׵��� new�� ����ؼ� ��ü�� �������� �� �������Լ��� ������ �Է��� ���� �����µ�, compiler�� ������ �������Լ��� �Է��ϰ� �־��� ��.
package ch08_class1;

public class Square {
	private int side;
	public Square() { 	// ��ü�� ������ �� ������ ȣ��Ǵ� �Լ�. public�̾�� ��. ��return type�� ������. class��� �����ؾ���.
//������ ȣ�� �Ұ�! new �� ������ �� �� �ѹ� �����.
		System.out.println("�Ű������� ���� ������ �Լ� ȣ���");
	}
	public Square(int side) {	//�Ű����� �ִ� ������ �Լ��� �뵵 : �������ʱ�ȭ
		this.side = side;
		System.out.println("�Ű����� �ִ� ������ �Լ� ȣ���. side �ʱ�ȭ�� ��");
	}
	public int area() {
		return side * side;
	}
	public void setSide(int side) {	// Square s = new Square(); s.setSide(10);
		this.side = side;
	}
	public int getSide() {	//s.getside()
		return side;
	}

}
