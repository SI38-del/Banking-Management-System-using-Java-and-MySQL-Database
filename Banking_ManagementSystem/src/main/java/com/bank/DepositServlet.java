package com.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int accNo = (int) session.getAttribute("account_no");
		double amount = Double.parseDouble(req.getParameter("amount"));
		
		try {
			Connection con = DBConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(
		  "UPDATE users SET balance = balance + ? WHERE account_no = ?"
		            );
			
			 ps.setDouble(1, amount);
	         ps.setInt(2, accNo);
	         ps.executeUpdate();
	         
	      // transaction entry
	         PreparedStatement ps2 = con.prepareStatement(
"INSERT INTO transactions(account_no, txn_type, amount) VALUES (?, ?, ?)"
	             );
	         
	         ps2.setInt(1, accNo);
	         ps2.setString(2, "Deposit");
	         ps2.setDouble(3, amount);
	         ps2.executeUpdate();
	         resp.sendRedirect("dashboard.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
	}

}
