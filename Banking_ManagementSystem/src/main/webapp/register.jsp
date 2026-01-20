<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
     <div  class="row justify-content-center mt-5">
      <div class="col-md-6">
       <div class="card shadow">
        <div class="card-body">
            <h2  class="card-title text-center mb-4">User Registration</h2>
            
            <%
    String msg = request.getParameter("msg");
    if (msg != null) {
    %> 
     <p style="color:green;"><%= msg %></p>
   <%
    }
   %>
   
   <form action="register" method="post">
     <div class="mb-3">
         <label for="name" class="form-label">Name</label>
         <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required>
     </div>
     
     <div class="mb-3">
         <label for="email" class="form-label">Email</label>
         <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
     </div>
     
      <div class="mb-3">
         <label for="password" class="form-label">Password</label>
         <input type="password" name="password" class="form-control" id="password" placeholder="Enter a password" required>
      </div>
      
      <div class="d-grid gap-2">
           <button type="submit" class="btn btn-primary btn-block">Register</button>
      </div>
   </form>
   
   <hr>
      <div class="text-center">
          <a href="index.html" class="text-decoration-none">Back to Home</a>
     </div>
    
        </div>
       </div>
      </div>
     </div>
    </div>
    
    






    
    
</body>
</html>