package com.user;

public class Client {

	private int id;
	private String email;
	private int age;
	
	
	public Client(int id, String email, int age) {
		this.id = id;
		this.email = email;
		this.age = age;
	}


	public int getId() {
		return id;
	}


	public String getEmail() {
		return email;
	}


	public int getAge() {
		return age;
	}
	
	
}
