<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDaoImp"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>

<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center fw-bold" role="alert">${succMsg }</div>

		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center fw-bold" role="alert">${failedMsg }</div>

		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<c:if test=""></c:if>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDaoImp dao = new CartDaoImp(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());

								double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<th>Total Price</th>
									<td></td>
									<td><%=totalPrice%></td>
									<td></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Detail for Order</h3>
						<form action="order" method="post" class="row">
						
							<input type="hidden" name="id" value="${userobj.id }">
							
							<div class="col-md-6">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" name="username" value="<%= u.getName()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" name="email" value="<%= u.getEmail()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">Phone Number</label> <input
									type="number" class="form-control" name="phone" value="<%= u.getPhoneNo()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" name="address" required="required">
							</div>
							<div class="col-md-6">
								<label for="land" class="form-label">Landmark</label> <input
									type="text" class="form-control" name="land" required="required">
							</div>
							<div class="col-md-6">
								<label for="city" class="form-label">City</label> <input
									type="text" class="form-control" name="city" required="required">
							</div>
							<div class="col-md-6">
								<label for="state" class="form-label">State</label> <input
									type="text" class="form-control" name="state" required="required">
							</div>
							<div class="col-md-6">
								<label for="code" class="form-label">Pin Code</label> <input
									type="text" class="form-control" name="code" required="required">
							</div>
							<div class="col-md-12">
								<label class="form-label" for="order">Preference</label> <select
									class="form-select" name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>
							<div class="container text-center mt-2">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>