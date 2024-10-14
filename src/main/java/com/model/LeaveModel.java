package com.model;

public class LeaveModel {
	
	private int leaveId;
	private String requestDate;
    private String reason;
    private String days;
    private String status;

	public LeaveModel() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param leaveId
	 * @param date
	 * @param reason
	 * @param days
	 * @param status
	 */
	public LeaveModel(int leaveId, String requestDate, String reason, String days, String status) {
		super();
		this.leaveId = leaveId;
		this.requestDate = requestDate;
		this.reason = reason;
		this.days = days;
		this.status = status;
	}

	public int getLeaveId() {
		return leaveId;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public String getReason() {
		return reason;
	}

	public String getDays() {
		return days;
	}

	public String getStatus() {
		return status;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
