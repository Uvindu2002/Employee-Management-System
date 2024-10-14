package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AdminDao;

@WebServlet("/AdminAddServelet")
public class AdminAddServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminAddServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		
		boolean isTrue;
		isTrue = AdminDao.addAdmin(firstName, lastName, email, mobile, password);
		
		if (isTrue == true) {
			response.sendRedirect("admin/admins.jsp");
		} else {
			response.sendRedirect("admin/addAdmin.jsp");
		}
	}

}
