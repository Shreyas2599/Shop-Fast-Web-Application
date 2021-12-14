<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*" %>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>
<%
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			List<Category>list=cdao.getCategories();
			
			
			//getting count
		Map<String,Long> m=	Helper.getCounts(FactoryProvider.getFactory());
			
			
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body{
	background-color: #d1c4e9 !important;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
}
</style>
</head>
<body >
	<%@include file="components/navbar.jsp"%>


	<div class="container">
	<div class="container-fluid mt-2">
	<%@include file="components/message.jsp" %>
	
	</div>
		<div class="row mt-5">

			<!-- first col -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container text-center ">
							<img alt="" src="icon/group.png" style="max-width: 100px">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1 class="display-4">Users</h1>
					</div>
				</div>
			</div>

			<!-- second col -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container text-center">
							<img alt="" src="icon/categories.png" style="max-width: 100px">
						</div>
						<h1><%=list.size() %></h1>
						<h1 class="display-4">Categories</h1>
					</div>
				</div>
			</div>

			<!-- third col -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container text-center">
							<img alt="" src="icon/products.png" style="max-width: 100px">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="display-4">Products</h1>
					</div>
				</div>
			</div>


		</div>
		<!-- second row -->
		<div class="row mt-5">
			<!-- first box -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center">
						<div class="container text-center ">
							<img alt="" src="icon/add-to-cart.png" style="max-width: 100px">
						</div>
						<h1>Click here</h1>
						<h1 class="display-4">Add Categories</h1>
					</div>
				</div>
			</div>
			<!-- second box -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#exampleModals">
					<div class="card-body text-center">
						<div class="container text-center ">
							<img alt="" src="icon/new-product.png" style="max-width: 100px">
						</div>
						<h1>Click here</h1>
						<h1 class="display-4">Add Products</h1>
					</div>
				</div>
			</div>

		</div>


	</div>
	<!-- add category modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg">
			
			<div class="modal-content">
				
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
					<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Required category title" required="required">
						</div>
						<div class="form-group mt-3">
							<textarea style="height: 100px" class="form-control"
								placeholder="Enter category description" required="required"
								name="catDescription"></textarea>
						</div>
						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add Category</button>
							<button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- end category modal -->
	<!-- add product modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModals" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="operation" value="addproduct">
						
						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product title" required="required">
						</div>
						<div class="form-group mt-3">
							<textarea style="height: 100px" class="form-control"
								placeholder="Enter product description" required="required"
								name="pDesc"></textarea>
						</div>
						
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Price " required="required">
						</div>
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Discount" required="required">
						</div>
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Quantity" required="required">
						</div>
						
						<!-- product category -->
					<%-- 	<%
						CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
								List<Category>list=cdao.getCategories();
						%> --%>
						<div class="form-group mt-3">
							<select name="catId" class="form-control" id="">
							<!-- <option value="laptop">Laptop</option> -->
						<%
						for(Category c:list){
						%>
						<option value="<%=c.getCategoryId() %>"> <%=c.getCategoryTitle() %></option>
						
						<%} %>
							</select>
						</div>
						
						<!-- product file -->
						
						<div class="mt-3">
						<label for="pPic">Select Picture</label>
							<input type="file" name="pPic"  id="pPic" class="form-control" required="required">
						</div>
						
						
						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add Product</button>
							<button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</form>


				</div>

			</div>
		</div>
	</div>


	<!-- end product modal -->

<%@include file="components/common_modals.jsp"%>







</body>
</html>