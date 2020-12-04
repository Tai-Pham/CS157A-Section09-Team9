package com.front;

public class LocationInfo {

	private String address;
	private String name;
	private String open_hour;
	private	int turnaround_time;
	private String phone;
	private String info;
	
	public LocationInfo(String address, String name, String open_hour, int turnaround_time, String phone, String info) {
		this.address = address;
		this.name = name;
		this.open_hour = open_hour;
		this.turnaround_time = turnaround_time;
		this.phone = phone;
		this.info = info;
		
	}
	
	public String getInfo() {
		return info;
	}

	public String getAddress() {
		return address;
	}

	public String getName() {
		return name;
	}

	public String getOpen_hour() {
		return open_hour;
	}

	public int getTurnaround_time() {
		return turnaround_time;
	}

	public String getPhone() {
		return phone;
	}
	
	
	
}
