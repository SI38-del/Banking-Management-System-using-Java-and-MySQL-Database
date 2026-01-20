<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bank.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    Integer accNo = (Integer) session.getAttribute("account_no");
    if (accNo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transaction History</title>
<!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
          rel="stylesheet">
</head>
<body class="bg-light">
   <div class="container mt-5">
    <!-- Card -->
    <div  class="card shadow-lg">
     <div class="card-header bg-primary text-white text-center">
      <h3>Transaction History</h3>
     </div>
     
     
     <div class="card-body">
      <table class="table table-bordered table-striped table-hover text-center">
        <thead class="table-dark">
                    <tr>
                        <th>Transaction ID</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Date and Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                
                <tbody>
                 <% 
                  try{
                	  Connection con = DBConnection.getConnection();
                	  PreparedStatement ps = con.prepareStatement(
   "SELECT * FROM transactions WHERE account_no=? ORDER BY txn_date DESC"
                          );
                	  
                	  ps.setInt(1, accNo);
                      ResultSet rs = ps.executeQuery();
                      
                      boolean hasData = false;
                      while (rs.next()){
                    	  hasData = true;
                    	  
                    	  %>
                    	  <tr>
                    	   <td><%= rs.getInt("txn_id") %></td>
                    	   <td>
                            <span class="badge 
                                <%= rs.getString("txn_type").equalsIgnoreCase("Deposit") 
                                ? "bg-success" : "bg-danger" %>">
                                <%= rs.getString("txn_type") %>
                            </span>
                        </td>
                        <td><%= rs.getDouble("amount") %></td>
                        <td><%= rs.getTimestamp("txn_date") %></td>
                 <td><a href="deleteTransaction?txn_id=<%= rs.getInt("txn_id")%>" class="btn btn-outline-dark">Delete</a></td>
                    	  </tr>
                    	  
                    	  <%
                      }
                      if (!hasData){
                    	  
                      
                    	  %>
                    	  
                    <tr>
                        <td colspan="4" class="text-muted">No transactions found</td>
                    </tr>
                    <%
                      }
                  }catch (Exception e) {
                      e.printStackTrace();
                  }
                    %>	  
                      
                  
                 
                </tbody>
      </table>
      
          <div class="text-center mt-4">
                <a href="dashboard.jsp" class="btn btn-secondary">
                    Back to Dashboard
                </a>
            </div>
      
     </div>
    </div>
   </div>
  

</body>
</html>