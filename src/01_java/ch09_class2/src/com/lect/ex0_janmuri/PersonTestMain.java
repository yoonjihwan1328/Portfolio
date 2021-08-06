package com.lect.ex0_janmuri;

class Person {
	//public class�� �������� �����̳� �� Ŭ������ �ϳ��� ������(?)�� �ۼ��ϱ� ���ؼ� public�κ��� ����
	//���±����� main������ �׻� ������ �����ؿԾ���. --- ������ ���θ� ���� bin������ PersonŬ������ mainŬ������ ������ ������ ������ Ȯ���� �� �ִ�.
	//									 --- ���� ȭ�鿡 Person�� ������ ��� public�� �ƴϹǷ� �ٸ� ��(?)���� ����� �� ���Եȴ� ���� public���� ������ classȭ�鿡�� �۾��� ���� ��õ
	private String name;
	private int age;
	private char gender;	// 'm','f'
	
	//1. �Ű����� ���� ������ �Լ�
	public Person() {}
	public Person(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	public String infoString() {	// �޼��� �̸��� inforString
		String result = "�̸� : " + name + ", ���� : " + age + ", gender : " + gender;
		return result;
	}
	public void infoPrint() {
		System.out.printf("�̸� : %s, ���� : %d, ���� : %c", name, age, gender);
	}


	public void setName(String name) {	//Person[] �迭�� ����ٰ� ���͸� ������ �Ѵٸ鼭 ����� ����
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
		//��ü���� 2�� �����ϰ� ����ϱ�
/*		Person kim = new Person("ȫ�浿", 20, 'm');
		System.out.println(kim.infoString());	// �ż��� infoString�� ����� ����ϴ� ���
		kim.infoPrint();						// public void inforPrint�� ���� ���
		*/
		Person[] person = {new Person("ȫ�浿", 20, 'm'),
						   new Person("��û", 22, 'f'),
						   new Person()
		};
		person[2].setName("�߽ż�"); person[2].setAge(25); person[2].setGender('m');
		for(int idx=0; idx<person.length ; idx++) {	//�Ϲ� for����
			//	person[idx].infoPrint();
			System.out.println(person[idx].infoString());
		}
		for(Person p : person) {
			//p.infoPrint();
			System.out.println(p.infoString());
		}
	}
}

