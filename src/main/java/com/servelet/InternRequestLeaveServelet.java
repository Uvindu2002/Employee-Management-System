package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InternLeaveDao;

/**
 * Servlet implementation class InternRequestLeaveServelet
 */
@WebServlet("/InternRequestLeaveServelet")
public class InternRequestLeaveServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InternRequestLeaveServelet() {
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
        
        boolean isTrue;
		isTrue = InternLeaveDao.addleave(reason, days, internId, requestDate);
		
		if (isTrue == true) {
			response.sendRedirect("intern/myLeave.jsp");
		} else {
			response.sendRedirect("intern/requestLeave.jsp");
		}
	}

}
