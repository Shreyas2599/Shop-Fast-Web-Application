
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First to access	checkout page");
	response.sendRedirect("login.jsp");
	return;
} else {

}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- cart data -->
				<div class="card">
					<div class="card-body">
						<h1 class="text-center mb-3">Your Selected Items</h1>
						<div class="cart-body"></div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<!-- form details -->
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h1 class="text-center mb-3">Your Details for order</h1>
						<form action="">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input value="<%=user.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">Your Name </label> <input
									value="<%=user.getUserName()%>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>
							<div class="form-group mb-3">
								<label for="text">Your Shipping address</label> <input
									value="<%=user.getUserAddress()%>" class="form-control"
									placeholder="Leave a comment here" id="floatingTextarea"
									placeholder="Enter your address"></input>
							</div>
							<div class="form-group mb-3">
								<label for="phone" class="form-label">Mobile no.</label>
								<input value="<%=user.getUserPhone() %>" name="user_phone" type="number" class="form-control"
									id="phone" placeholder="Enter your phone no."
									aria-describedby="emailHelp">
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success mt-2">Order now</button>
								<button class="btn btn-outline-primary mt-2">Continue
									Shopping</button>
							</div>


						</form>

					</div>
				</div>
			</div>

		</div>

	</div>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>