package com.lec.ex;
// �޼���, c���� �޼���� �θ�, python������ �Լ��� �θ�
public class Ex02_method {
	public static void main(String[] args) {
		int tot = sum(1, 10);	//1, 10�� argument(�μ� or �Ű����� ��� �θ�)
		System.out.println(evenOdd(tot));
		tot = sum(10, 100);
		System.out.println(evenOdd(tot));
	}	
	
	private static String evenOdd(int i) {
//		String result = "";
//		if(i%2 ==0) {
//			result = "¦��";
//		}else {
//			result = "Ȧ��";
//		}
//		String result = i%2==0 ? "¦��" : "Ȧ��" ;
//		return result;	//return ��� �þ���? python�ΰ�? ���� �����ΰ�?

		String result = i%2==0 ? "¦��" : "Ȧ��" ;
		return result;
		
		
		
	}
	private static int sum(int from, int to) {
		int result = 0;
		for(int i = from; i<= to; i++) {
			result +=i;
		}
		return result;
	}


}
