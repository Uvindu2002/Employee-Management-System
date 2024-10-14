package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InternDao;

@WebServlet("/InternApplyServelet")
public class InternApplyServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InternApplyServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        int department = Integer.parseInt(request.getParameter("department"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        
        boolean isTrue;
		isTrue = InternDao.addIntern(firstName, lastName, email, mobile, department, gender, address);
		
		if (isTrue == true) {
			response.sendRedirect("./index.jsp");
		} else {
			response.sendRedirect("./internApply.jsp");
		}
	}

}
