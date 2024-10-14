package com.model;

public class Salerymodel {
	
	private int salaryId;
    private double basicSalary;
    private double bonusAmount;
    private int employeeId;

	public Salerymodel() {
		// TODO Auto-generated constructor stub
	}

	
	public Salerymodel(int salaryId, double basicSalary, double bonusAmount, int employeeId) {
		super();
		this.salaryId = salaryId;
		this.basicSalary = basicSalary;
		this.bonusAmount = bonusAmount;
		this.employeeId = employeeId;
	}

	public int getSalaryId() {
		return salaryId;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public double getBonusAmount() {
		return bonusAmount;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setSalaryId(int salaryId) {
		this.salaryId = salaryId;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public void setBonusAmount(double bonusAmount) {
		this.bonusAmount = bonusAmount;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
	

}
