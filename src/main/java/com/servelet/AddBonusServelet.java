package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SaleryDao;


@WebServlet("/AddBonusServelet")
public class AddBonusServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddBonusServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String bonus = request.getParameter("bonus");
        int employeeId = Integer.parseInt(request.getParameter("employee"));
        
        boolean isTrue;
		isTrue = SaleryDao.addAdmin(employeeId, bonus);
		
		if (isTrue == true) {
			response.sendRedirect("admin/bonus.jsp");
		} else {
			response.sendRedirect("admin/addBonus.jsp");
		}
	}

}
