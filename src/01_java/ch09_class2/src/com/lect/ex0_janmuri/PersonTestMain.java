package com.lect.ex0_janmuri;

class Person {
	//public class가 정상적인 형태이나 두 클래스를 하나의 페이지(?)에 작성하기 위해서 public부분을 삭제
	//여태까지는 main파일이 항상 별도로 존재해왔었음. --- 컴파일 여부를 보면 bin폴더에 Person클래스와 main클래스가 별도로 컴파일 됐음을 확인할 수 있다.
	//									 --- 같은 화면에 Person을 포함한 경우 public이 아니므로 다른 데(?)에서 사용할 수 없게된다 따라서 public으로 별도의 class화면에서 작업할 것을 추천
	private String name;
	private int age;
	private char gender;	// 'm','f'
	
	//1. 매개변수 없는 생성자 함수
	public Person() {}
	public Person(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	public String infoString() {	// 메서드 이름은 inforString
		String result = "이름 : " + name + ", 나이 : " + age + ", gender : " + gender;
		return result;
	}
	public void infoPrint() {
		System.out.printf("이름 : %s, 나이 : %d, 성별 : %c", name, age, gender);
	}


	public void setName(String name) {	//Person[] 배열을 만들다가 세터를 만들어야 한다면서 만들기 시작
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
}
public class PersonTestMain {
	public static void main(String[] args) {
		//객체변수 2개 생성하고 출력하기
/*		Person kim = new Person("홍길동", 20, 'm');
		System.out.println(kim.infoString());	// 매서드 infoString을 만들어 출력하는 방법
		kim.infoPrint();						// public void inforPrint를 만든 경우
		*/
		Person[] person = {new Person("홍길동", 20, 'm'),
						   new Person("심청", 22, 'f'),
						   new Person()
		};
		person[2].setName("추신수"); person[2].setAge(25); person[2].setGender('m');
		for(int idx=0; idx<person.length ; idx++) {	//일반 for구문
			//	person[idx].infoPrint();
			System.out.println(person[idx].infoString());
		}
		for(Person p : person) {
			//p.infoPrint();
			System.out.println(p.infoString());
		}
	}
}

