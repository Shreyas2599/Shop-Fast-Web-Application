<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">


<div class="card mt-3">
<div class="card-header custom-bg text-white">
<div style="text-align: center"><img alt="" src="img/login.png" style="max-width:100px">
<h3>Login here</h3>
</div>
</div>
<div class="card-body">
<%@include file="components/message.jsp" %>
<form action="LoginServlet" method="post"> 
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <a href="register.jsp" class="text-center d-block mb-3">If not registered click here</a>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
  <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
  
  </div>
</form>
</div>



</div>





</div>
</div>


</div>






















</body>
</html>