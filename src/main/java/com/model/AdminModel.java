package com.model;

public class AdminModel {
	
	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;	
	private String phone;
	
	public AdminModel(String id, String firstName, String lastName,String email, String password, String phone) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phone = phone;
	}

	public AdminModel() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	

	public String getEmail() {
		return email;
	}


	public String getPassword() {
		return password;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

		

}
