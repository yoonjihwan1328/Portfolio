package com.lect.ex6_product;

public class ProductTestMain {
	public static void main(String[] args) {
		System.out.println(Product.count);
		Product p1 = new Product("에어콘");
		p1.infoPrint();
		Product p2 = new Product("에어콘");
		p2.infoPrint();
	}


}	// static의 용법 1. 특정한 변수 중 공유하고 싶은 것이 있을 때 ???
	// static의 용법 2. 
