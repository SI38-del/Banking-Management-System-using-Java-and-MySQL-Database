package com.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        try {
        	Connection con = DBConnection.getConnection();
        	
        	PreparedStatement ps = con.prepareStatement(
           "INSERT INTO users(name, email, password, balance) VALUES (?, ?, ?, ?)"
                );
        	
        	ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setDouble(4, 0);
            
            ps.executeUpdate();
            
            resp.sendRedirect("register.jsp?msg=Registration Successful");
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
			 resp.sendRedirect("register.jsp?msg=Registration Failed");
		}
	}

}
