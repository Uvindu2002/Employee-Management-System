package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SaleryDao;


@WebServlet("/UpdateBonusServelet")
public class UpdateBonusServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateBonusServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int saleryId = Integer.parseInt(request.getParameter("saleryId"));
        String bonus = request.getParameter("bonus");
        
        boolean isTrue;
		isTrue = SaleryDao.updateBonus(saleryId, bonus);
		
		if (isTrue == true) {
			response.sendRedirect("./admin/bonus.jsp");
		} else {
			response.sendRedirect("./admin/manageBonus.jsp");
		}
	}

}
