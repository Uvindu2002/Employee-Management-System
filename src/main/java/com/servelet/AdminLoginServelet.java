package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDao;
import com.DAO.EmployeeDao;
import com.DAO.InternDao;
import com.connection.DBConnect;
import com.model.AdminModel;
import com.model.EmployeeModel;
import com.model.InternModel;

@WebServlet("/AdminLoginServelet")
public class AdminLoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminLoginServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao dao = new AdminDao(DBConnect.getConnection());
		EmployeeDao dao1 = new EmployeeDao(DBConnect.getConnection());
		InternDao dao2 = new InternDao(DBConnect.getConnection());
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String position = request.getParameter("position");
        
        if ("admin".equals(position)) {
        	
        	AdminModel em = dao.login(email, password); 
            if (em != null ) { 	
            	    session.setAttribute("adminObj", em);
            	    response.sendRedirect("./admin/mainAdminDashboard.jsp");
            }else {
            	session.setAttribute("failMessage", "Email or password incorrect");
            	response.sendRedirect("login.jsp");        	
            	
            }
        }else if ("employee".equals(position)) {
        	EmployeeModel em2 = dao1.login(email, password); 
            if (em2 != null ) { 	
            	    session.setAttribute("empObj", em2);
            	    response.sendRedirect("./employee/mainEmployeeDashboard.jsp");
            }else {
            	session.setAttribute("failMessage", "Email or password incorrect");
            	response.sendRedirect("login.jsp");        	
            	
            }
        } else if ("intern".equals(position)) {
        	InternModel em3 = dao2.login(email, password); 
            if (em3 != null ) { 	
            	    session.setAttribute("intObj", em3);
            	    response.sendRedirect("./intern/mainInternDashboard.jsp");
            }else {
            	session.setAttribute("failMessage", "Email or password incorrect");
            	response.sendRedirect("login.jsp");        	
            	
            }
        }
        
        
	}

}
