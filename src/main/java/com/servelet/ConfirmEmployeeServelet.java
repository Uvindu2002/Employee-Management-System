package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.EmployeeDao;

@WebServlet("/ConfirmEmployeeServelet")
public class ConfirmEmployeeServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ConfirmEmployeeServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String salery = request.getParameter("salery");
        
        boolean isTrue;
		isTrue = EmployeeDao.confirmEmployee(employeeId, salery);
		
		if (isTrue == true) {
			response.sendRedirect("./admin/applyEmployee.jsp");
		} else {
			response.sendRedirect("./admin/viewEmployeeApplication.jsp");
		}
	}

}
