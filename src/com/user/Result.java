package com.user;

public class Result {

	private String name;
	private String email;
	private String start;
	private String end;
	private String result;
	
	
	public Result(String name, String email, String start, String end, String result) {
		super();
		this.name = name;
		this.email = email;
		this.start = start;
		this.end = end;
		this.result = result;
	}


	public String getName() {
		return name;
	}


	public String getEmail() {
		return email;
	}


	public String getStart() {
		return start;
	}


	public String getEnd() {
		return end;
	}


	public String getResult() {
		return result;
	}
	
	
	
	
}
