//패키지명, 클래스명, 데이터, #생성자함수#, 메소드, setter&getter
//main*() ; Square s new Square() 의 형태로 main함수에서 개체를 만들것으로 예상된다.(Square 생성자함수가 호출되는 시기!)
//			Square s1 = new Square(10);	와 같이 동일한 형태의 함수가 매개변수의 유무차이만으로 각각 생성가능하다.
// 그동안 new를 사용해서 개체가 생성됐을 대 생성자함수를 별도로 입력한 적이 없었는데, compiler가 스스로 생성자함수를 입력하고 있었던 것.
package ch08_class1;

public class Square {
	private int side;
	public Square() { 	// 개체가 생성될 때 저절로 호출되는 함수. public이어야 함. ★return type이 없음★. class명과 동일해야함.
//별도로 호출 불가! new 로 생성될 때 단 한번 실행됨.
		System.out.println("매개변수가 없는 생성자 함수 호출됨");
	}
	public Square(int side) {	//매개변수 있는 생성자 함수의 용도 : 데이터초기화
		this.side = side;
		System.out.println("매개변수 있는 생성자 함수 호출됨. side 초기화도 함");
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
