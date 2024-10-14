package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InternLeaveDao;

/**
 * Servlet implementation class InternUpdateLeaveServelet
 */
@WebServlet("/InternUpdateLeaveServelet")
public class InternUpdateLeaveServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InternUpdateLeaveServelet() {
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
        int internId = Integer.parseInt(request.getParameter("internId"));
        int leaveId = Integer.parseInt(request.getParameter("leaveId"));
        
        boolean isTrue;
		isTrue = InternLeaveDao.updateLeave(leaveId, requestDate, reason, days, internId);
		
		if (isTrue == true) {
			response.sendRedirect("intern/myLeave.jsp");
		} else {
			response.sendRedirect("intern/myLeave.jsp");
		}
	}

}
