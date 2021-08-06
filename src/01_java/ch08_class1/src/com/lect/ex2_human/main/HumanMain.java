package com.lect.ex2_human.main;

import com.lect.ex2_human.*;

//main함수가 있는 곳 : com.lect.ex2_human.main
//Man, Woman 있는 곳 : com.lect.ex2_human
//같은 패키지이면 import가 필요없음. but 다른 패키지로 분류되기 때문에 import를 실시해야함.
public class HumanMain {
	public static void main(String[] args) {
		Man man = new Man();
		Woman woman = new Woman();
		Man man2 = new Man(100);
	}
}
 