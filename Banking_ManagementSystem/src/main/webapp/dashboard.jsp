<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    Integer acc = (Integer) session.getAttribute("account_no");
    String name = (String) session.getAttribute("name");

    if (acc == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
   <!-- Navbar -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
     <span class="navbar-brand">Banking System</span>
     <div class="d-flex text-white">
      Welcome, <strong class="ms-2"><%= name %></strong>
     </div>
    </div>
   </nav>
   
   <!-- Main Container -->
   <div class="container mt-5">
    <div class="row g-4">
     <!-- Deposit Card -->
      <div class="col-md-4">
       <div class="card shadow text-center">
        <div class="card-body">
         <h5 class="card-title">Deposit</h5>
           <p class="card-text">Add money to your account</p>
           <a href="deposit.jsp" class="btn btn-success w-100">Deposit</a>
        </div>
       </div>
      </div>
      
       <!-- Withdraw Card -->
       <div class="col-md-4">
       <div class="card shadow text-center">
        <div class="card-body">
         <h5 class="card-title">Withdraw</h5>
           <p class="card-text">Withdraw money securely</p>
           <a href="withdraw.jsp" class="btn btn-warning w-100">Withdraw</a>
        </div>
       </div>
      </div>
      
      
       <!-- Logout Card -->
       <div class="col-md-4">
       <div class="card shadow text-center">
        <div class="card-body">
         <h5 class="card-title">Logout</h5>
           <p class="card-text">End your secure session</p>
           <a href="logout" class="btn btn-danger w-100">Logout</a>
        </div>
       </div>
      </div>
      
      
      <!-- Transaction History -->
       <div class="col-md-4">
       <div class="card shadow text-center">
        <div class="card-body">
         <h5 class="card-title">History</h5>
           <p class="card-text">View Transaction History</p>
           <a href="history.jsp" class="btn btn-info w-100">History</a>
        </div>
       </div>
      </div>
      
    </div>
   </div>
   
   <!-- Footer -->
   <footer class="text-center mt-5 text-muted">
    <p>© 2026 Banking Management System</p>
   </footer>


</body>
</html>