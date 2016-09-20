package kosta125.team3.park;

import java.sql.Timestamp;

public class CalVO {
	
	

	private String parkNum , carNum ;
	private Timestamp inTime, outTime;
	private int pay;
	
	public String getParkNum() {
		return parkNum;
	}
	public void setParkNum(String parkNum) {
		this.parkNum = parkNum;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public Timestamp getInTime() {
		return inTime;
	}
	public void setInTime(Timestamp inTime) {
		this.inTime = inTime;
	}
	public Timestamp getOutTime() {
		return outTime;
	}
	public void setOutTime(Timestamp outTime) {
		this.outTime = outTime;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
}
