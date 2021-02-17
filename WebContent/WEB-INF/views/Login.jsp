<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 
<title>Login</title>


<link rel="stylesheet" href = "css/bootstrap.css"> 

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
<!-- Custom styles for this template -->

 
<link rel="stylesheet" href = "css/signin.css"> 
</head>
<body>
<script>


</script>
<body class="text-center">
  <form class="form-signin" action="<%=request.getContextPath()%>/Login" method="POST">
	  <img class="mb-4" src="../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
	  <div>
	  <span>${message}</span>
	  </div>
	  <h1 class="h3 mb-3 font-weight-bold" >Sign In</h1>
	  <label for="inputEmail" class="sr-only">Email address</label>
	  <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
	  <label for="inputPassword" class="sr-only">Password</label>
	  <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
	  <div class="checkbox mb-3">
	    <label>
	      <input type="checkbox" value="remember-me"> Remember me
	    </label>
	  </div>
	  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	  <div class="container">
	    <a href="<%=request.getContextPath()%>/Register">Don't have account ? Register Here</a>
	  </div>
	  <p class="mt-5 mb-3 text-muted">&copy; Bram Co. 2020</p>
</form> 
</body>

<!-- <form action="LoginRegister">
<table style="background-color: skyblue; margin: auto">
<tr>
<td><h3 style="color : red; text-align: center">LOGIN</h3></td>
<td></td>
</tr>
<tr>
<td>User Name :</td>
<td><input type="text" name="userName"></td>
</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="password"></td>
</tr>
<tr>
<td><input type="submit" name="submit" value="Login"></td>
<td><a href="Register.jsp">Registration</a></td>
</tr>


</table>
</form> -->

</body>
</html>