package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InternDao;


@WebServlet("/UpdateInternProfile")
public class UpdateInternProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateInternProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        int internId = Integer.parseInt(request.getParameter("internId"));
        
        boolean isTrue;
		isTrue = InternDao.updateIntern(internId, firstName, lastName, email, mobile, address);
		
		if (isTrue == true) {
			response.sendRedirect("./intern/mainInternDashboard.jsp");
		} else {
			response.sendRedirect("./intern/mainInternDashboard.jsp");
		}
	}

}
