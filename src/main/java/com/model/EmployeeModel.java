package com.model;

public class EmployeeModel {
	
	private int employeeId; 
    private String firstName;
    private String lastName;
    private String email;
    private String mobile;
    private int departmentId; 
    private String gender;
    private String address;
    private int status;

	public EmployeeModel() {
		// TODO Auto-generated constructor stub
	}

	public EmployeeModel(int employeeId, String firstName, String lastName, String email, String mobile,
			int departmentId, String gender, String address, int status) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobile = mobile;
		this.departmentId = departmentId;
		this.gender = gender;
		this.address = address;
		this.status = status;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public String getGender() {
		return gender;
	}

	public String getAddress() {
		return address;
	}

	public int getStatus() {
		return status;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
