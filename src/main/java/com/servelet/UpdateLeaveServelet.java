package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.LeaveDao;

/**
 * Servlet implementation class UpdateLeaveServelet
 */
@WebServlet("/UpdateLeaveServelet")
public class UpdateLeaveServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLeaveServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reason = request.getParameter("reason");
        String days = request.getParameter("days");
        String requestDate = request.getParameter("requestDate");
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int leaveId = Integer.parseInt(request.getParameter("leaveId"));
        
        boolean isTrue;
		isTrue = LeaveDao.updateLeave(leaveId, requestDate, reason, days, employeeId);
		
		if (isTrue == true) {
			response.sendRedirect("employee/myLeave.jsp");
		} else {
			response.sendRedirect("employee/myLeave.jsp");
		}
	}

}
