package com.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        try {
        	Connection con = DBConnection.getConnection();
        	
        	 PreparedStatement ps = con.prepareStatement(
                     "SELECT * FROM users WHERE email=? AND password=?"
                 );
        	 
        	 ps.setString(1, email);
             ps.setString(2, password);
             
             ResultSet rs = ps.executeQuery();
             
             if (rs.next()) {
            	 HttpSession session = req.getSession();
            	 session.setAttribute("account_no", rs.getInt("account_no"));
            	 session.setAttribute("name", rs.getString("name"));
            	 
            	 resp.sendRedirect("dashboard.jsp");
			} else {
				resp.sendRedirect("login.jsp?error=1");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
            resp.sendRedirect("login.jsp?error=1");
		}

	}

}
