package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.LeaveDao;

/**
 * Servlet implementation class ConfirmLeaveEmployeeServelet
 */
@WebServlet("/ConfirmLeaveEmployeeServelet")
public class ConfirmLeaveEmployeeServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmLeaveEmployeeServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int leaveId = Integer.parseInt(request.getParameter("id"));
		
		boolean isTrue;
		isTrue = LeaveDao.acceptLeave(leaveId);
		
		if (isTrue == true) {
			response.sendRedirect("admin/acceptEmployeeLeave.jsp");
		} else {
			response.sendRedirect("admin/acceptEmployeeLeave.jsp");
		}
	}

}
