package com.lect.ex03_point;
//	Point3D p3 = new Point3D();
//	p3.pointPrint()
//	sysout(p3.pointInforString());	������
public class Point3D extends Point {
	private int z;
	public void point3dPrint() {
		System.out.printf("3���� ��ǥ : %d, %d, %d\n", getX(), getY(), z);
	}
	public String point3dInfoString() {
		//return String.format("3���� ��ǥ : %d, %d, %d\n", getX(), getY(), z);
	return "3���� ��ǥ : " + getX() + ", " +getY()+ ", "+z;
	}
	public int getZ() {
		return z;
	}
	public void setZ(int z) {
		this.z = z;
	}

}
