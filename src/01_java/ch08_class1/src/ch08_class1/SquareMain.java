package ch08_class1;

public class SquareMain {
	public static void main(String[] args) {
		Square s1 = new Square();
		System.out.println("s1�� �� ���� ���̴� " + s1.getSide());
		Square s2 = new Square(10);
		System.out.println("s2�� �� ���� ���̴�" + s2.getSide());
		s1.setSide(5);
		s2.setSide(9);
		System.out.println("s1�� ���̴� " + s1.area());
		System.out.println("s2�� ���̴� " + s2.area());
	}
}
//	SquareŬ������ SquareMain�� �ٿ� �� �� �ֳ���? -> �ϳ��� Ŭ�������� �ϳ��� public�� ����.
