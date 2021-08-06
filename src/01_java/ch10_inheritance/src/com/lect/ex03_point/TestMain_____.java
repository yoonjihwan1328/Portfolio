package com.lect.ex03_point;

public class TestMain_____ {
	public static void main(String[] args) {
//		Point point = new Point();
//		point.setX(5); point.setY(10);
//		point.pointPrint();
//		System.out.print(point.pointInfoString());
		Point3D point3d = new Point3D();
		point3d.setX(5);
		point3d.setY(10);
		point3d.setZ(15);
		point3d.pointPrint();	
		//상속을 희망하지 않는 row. 3차원 좌표를 표현하고 싶은데 상속함으로써 2차원 좌표도 같이 표현되는듯
		point3d.point3dPrint();
		System.out.println(point3d.point3dInfoString());
	}

}
