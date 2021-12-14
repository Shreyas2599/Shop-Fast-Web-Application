<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body{
	background-color: #d1c4e9 !important;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
<div class="container-fluid">

	<div class="row mt-3">
		<div class="col-md-4 offset-md-4">
		<div class="card">
		
		<%@include file="components/message.jsp" %>
		<div class="card-body px-3">
		<div style="text-align: center"><img alt="" src="img/retailer.png" style="max-width:100px"></div>
		<h3 class="text-center">Sign up here</h3>
			<form action="Register" method="post">
				<div class="form-group">
					<label for="name" class="form-label">User Name</label> 
					<input name="user_name" type="text" class="form-control"id="name" placeholder="Enter your name" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="email" class="form-label">User Email</label> 
					<input name="user_email" type="email" class="form-control"id="email" placeholder="Enter your email" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="password" class="form-label">User Password</label> 
					<input  name="user_password" type="password" class="form-control"id="password" placeholder="Enter your password" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="phone" class="form-label">User Phone number</label> 
					<input  name="user_phone" type="number" class="form-control"id="phone" placeholder="Enter your phone no." aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="phone" class="form-label">User Address</label> 
					<textarea name="user_address" style="height: 100px" class="form-control" id="address" placeholder="Enter your address" aria-describedby="emailHelp"></textarea>
				</div>
				
				<div class="container text-center mt-2">
				<button class="btn btn-outline-success">Register</button>
				<button class="btn btn-outline-warning">Reset</button>
				</div>




			</form>
		
		</div>
		</div>

		</div>


	</div>
</div>


























</body>
</html>