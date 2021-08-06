package com.lec.loop;
//1~100까지 숫자 중 3의 배수들의 합을 출력
public class Ex09_while {
	public static void main(String[] args) {
		int tot = 0 ;	// int = tot로만 선언하면 값이 할당된 상태는 아니고 4byte의 공간만이 확보된다...
		int i = 0;
		while (++i <= 100) {
			if (i%3 != 0) {	//Ex06_countinue에서와 반대 상황
				continue;
			}
			tot += i;	// if구문을 벗어나 본 열로 내려왔다는 것은 해당 수가 3의 배수임을 의미한다.
		}
	}


}
