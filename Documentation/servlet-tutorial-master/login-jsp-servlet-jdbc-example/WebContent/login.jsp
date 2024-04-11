<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Login Form</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f8f9fa; /* Bootstrap bg-light class color */
  }
  .form-control:focus {
    border-color: #007bff; /* Bootstrap primary color for focused input */
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Bootstrap focus shadow */
  }
</style>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary container mt-5">
    
    <main class="form-signin w-100 m-auto py-5 col-md-6 ">
      
      <form action="<%=request.getContextPath()%>/login" method="post" class="mt-4">
       
        <h1 class="h3 fw-normal mb-4">CTP Login</h1>  
          
        <div class="form-floating">
          <label for="UsernameInput">User Name:</label>
          <input type="text" class="form-control" name="username" id="UsernameInput" placeholder="Enter UserName">
        </div>
        
        <div class="form-floating mt-2">
            <label for="Password">Password:</label>
            <input type="password" class="form-control" name="password" placeholder="Enter Password" id="Password">
        </div>
        
        
        <button type="submit" class="btn btn-primary w-100 mt-4">Login!</button>

      </form>
    
    </main>
      
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
