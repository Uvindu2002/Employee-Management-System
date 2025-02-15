package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AdminDao;




@WebServlet("/AdminUpdateServelet")
public class AdminUpdateServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminUpdateServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("adminId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		
		boolean isTrue;
		
		isTrue = AdminDao.updateAdmin(userId, firstName, lastName, email, mobile);
		
		if (isTrue == true) {
			response.sendRedirect("admin/admins.jsp");
		} else {
			response.sendRedirect("admin/admins.jsp");
		}
	}

}
