package ch08_class1;

public class SquareMain {
	public static void main(String[] args) {
		Square s1 = new Square();
		System.out.println("s1의 한 변의 길이는 " + s1.getSide());
		Square s2 = new Square(10);
		System.out.println("s2의 한 번의 길이는" + s2.getSide());
		s1.setSide(5);
		s2.setSide(9);
		System.out.println("s1의 넓이는 " + s1.area());
		System.out.println("s2의 넓이는 " + s2.area());
	}
}
//	Square클래스를 SquareMain에 붙여 쓸 수 있나요? -> 하나의 클래스에는 하나의 public만 가능.
