package com.user;

public class Result {

	int id;
	String testerEmail;
	String clientEmail;
	String dateProcessed;
	String dateTested;
	boolean result;
	
	public Result(int id, String testerEmail, String clientEmail, String dateProcessed, String dateTested, boolean result) {
		this.id = id;
		this.testerEmail = testerEmail;
		this.clientEmail = clientEmail;
		this.dateProcessed = dateProcessed;
		this.dateTested = dateTested;
		this.result = result;
	}
	
	public int getId() {
		return id;
	}
	
	public String getTesterEmail() {
		return testerEmail;
	}
	
	public String getClientEmail() {
		return clientEmail;
	}
	
	public String getDateProcessed() {
		return dateProcessed;
	}
	
	public String getDateTested() {
		return dateTested;
	}
	
	public boolean getResult() {
		return result;
	}
}
