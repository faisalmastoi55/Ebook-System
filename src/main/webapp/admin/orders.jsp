<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
<%@include file="allCss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center py-3">Hello, Admin</h3>

		<div class="table-responsive">
			<table class="table table-striped">
				<thead class="bg-navbar-color text-white">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone No</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
					</tr>
				</thead>
				<tbody>
					<%
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getAllBookOrder();
					for (Book_Order b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUserName()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFullAddress()%></td>
						<td><%=b.getPhoneNo()%></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

</body>
</html>