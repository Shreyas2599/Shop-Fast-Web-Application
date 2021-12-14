<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body{
	background: url('img/clay.jpg') !important;
	background-size: cover;
	background-attachment: fixed;
}


.card {
	display:inline-block;
	
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	
	width: 270px ;
	margin-right:10px;
	
	
	

	
}


 .card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
} 
</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	<div class="row mt-3 mx-2">
		<%
			String cat =request.getParameter("category");
		
		
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		
		List<Product> list=null;
		
		if(cat==null || cat.trim().equals("all"))
		{
			list = dao.getAllProducts();
		}
		else
		{
			int cid=Integer.parseInt(cat.trim());
			list=dao.getAllProductsById(cid);
		}
		
		

		CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdo.getCategories();
		%>



		<!-- show category -->
		<div class="col-md-2 mt-4">
			<div class="list-group">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"
					aria-current="true"> All Products </a>

				<%
				for (Category category : clist) {
				%>
				<a href="index.jsp?category=<%=category.getCategoryId() %>" class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
		</div>



		<!-- show products -->

		<div class="col-md-10">
		
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product product : list) {
						%>
							
						<div class="card" >
							<div class="container text-center" >
							<img src="img/products/<%=product.getpPhoto()%>" style="max-height:200px;"
								class="card-img-top mt-2" alt="...">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=Helper.get10Words(product.getpName())%></h5>
								<p class="card-text">
									<%=Helper.get10Words(product.getpDesc())%>
								</p>

							</div>
							<div class="card-footer text-center">
								<button class="btn custom-bg text-white" style="padding: 10px" onclick="add_to_cart(<%=product.getpId()%> , '<%= product.getpName()%>',<%=product.getPriceAfterApplyDiscount()%>)">Add</button>
								<button class="btn btn-outline-success mt-2 " style="padding: 10px">
								<%=product.getPriceAfterApplyDiscount()%>/- <span class="text-secondary discount-label">Rs.<%=product.getpPrice() %> <%=product.getpDiscount() %>%Off</span></button>
							</div>
						</div>
						<%
						}
						
						if(list.size()==0)
						{
							out.println("<h3>No items in this category</h3>");
						}
						%>
					</div>

				</div>

			</div>
				
		</div>
	
	</div>
	<%@include file="components/common_modals.jsp" %>
	

</body>
</html>