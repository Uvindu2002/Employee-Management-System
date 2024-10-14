package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.EmployeeDao;


@WebServlet("/UpdateEmployeeProfile")
public class UpdateEmployeeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateEmployeeProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        
        boolean isTrue;
		isTrue = EmployeeDao.updateEmployee(employeeId, firstName, lastName, email, mobile, address);
		
		if (isTrue == true) {
			response.sendRedirect("./employee/mainEmployeeDashboard.jsp");
		} else {
			response.sendRedirect("./employee/mainEmployeeDashboard.jsp");
		}
	}

}
