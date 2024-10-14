package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.InternDao;


@WebServlet("/ConfirmInternServelet")
public class ConfirmInternServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ConfirmInternServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int internId = Integer.parseInt(request.getParameter("internId"));
        String salery = request.getParameter("salery");
        
        boolean isTrue;
		isTrue = InternDao.confirmIntern(internId, salery);
		
		if (isTrue == true) {
			response.sendRedirect("./admin/applyIntern.jsp");
		} else {
			response.sendRedirect("./admin/viewInternApplication.jsp");
		}
	}

}
