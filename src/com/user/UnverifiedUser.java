package com.user;

public class UnverifiedUser {

	int id;
	String name;
	String email;
	
	public UnverifiedUser(int id, String name, String email) {
		this.id = id;
		this.name = name;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

}
