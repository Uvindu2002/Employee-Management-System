package com.model;

public class InternLeaveModel {
	
	private int leaveId;
	private String requestDate;
    private String reason;
    private String days;
    private int status;

	public InternLeaveModel() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param leaveId
	 * @param requestDate
	 * @param reason
	 * @param days
	 * @param status
	 */
	public InternLeaveModel(int leaveId, String requestDate, String reason, String days, int status) {
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

	public int getStatus() {
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

	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
