<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Old Book</title>

<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container p-5">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead class="bg-navbar-color text-white">
					<tr>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th class="text-center" scope="col">Action</th>
					</tr>
				</thead>
				<tbody>

					<%
					User u = (User)session.getAttribute("userobj");
					String email = u.getEmail();

					BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
					List<BookDetls> list = dao.getBookByOld(email, "Old");

					for (BookDetls b : list) {
					%>

					<tr>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td class="text-center"><a
							href="delete_old_book?em=<%=email%>&&id=<%=b.getBookid() %>"
							class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
								Delete</a></td>
					</tr>

					<%
					}
					%>


				</tbody>
			</table>
		</div>
	</div>

</body>
</html>