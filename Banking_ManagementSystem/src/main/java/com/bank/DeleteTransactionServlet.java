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

@WebServlet("/deleteTransaction")
public class DeleteTransactionServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
		 Integer accNo = (Integer) session.getAttribute("account_no");
		 if (accNo == null) {
	            resp.sendRedirect("login.jsp");
	            return;
	        }
		 
		 int txnId = Integer.parseInt(req.getParameter("txn_id"));
		 
		 try {
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "DELETE FROM transactions WHERE txn_id=? AND account_no=?"
	            );

	            ps.setInt(1, txnId);
	            ps.setInt(2, accNo); // security check

	            ps.executeUpdate();

	            resp.sendRedirect("history.jsp");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
    
}


