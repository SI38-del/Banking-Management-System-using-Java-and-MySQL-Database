<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    if (session.getAttribute("account_no") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw</title>
<!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
          rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
   <div class="row justify-content-center">
    <div class="col-md-5">
     <div class="card shadow-lg">
      <div class="card-header bg-primary text-white text-center">
       <h2>Withdraw Money</h2>
      </div>
      
      <div class="card-body">
       <form action="withdraw" method="post">
         <div class="mb-3">
          <label class="form-label">Enter Amount</label>
          <input type="number" name="amount" class="form-control" placeholder="Enter amount"
                                   required>
         </div>
         
         <div class="d-grid">
         <button type="submit" class="btn btn-warning">Withdraw</button>
                        </div>
        </form>
      </div>
      
      <div class="card-footer text-center">
                    <a href="dashboard.jsp" class="btn btn-link">
                         Back to Dashboard
                    </a>
                </div>
     </div>
    </div>
   </div>
  </div>


</body>
</html>