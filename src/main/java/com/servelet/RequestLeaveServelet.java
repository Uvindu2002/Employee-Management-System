package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.LeaveDao;


@WebServlet("/RequestLeaveServelet")
public class RequestLeaveServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RequestLeaveServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reason = request.getParameter("reason");
        String days = request.getParameter("days");
        String requestDate = request.getParameter("requestDate");
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        
        boolean isTrue;
		isTrue = LeaveDao.addleave(reason, days, employeeId, requestDate);
		
		if (isTrue == true) {
			response.sendRedirect("employee/myLeave.jsp");
		} else {
			response.sendRedirect("employee/requestLeave.jsp");
		}
	}

}
