<%@page import="com.entity.BookDetls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>

<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">

	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
						BookDetls b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%= b.getBookid() %>">
							<div class="mb-3">
								<label class="form-label">Book Name*</label> <input type="text"
									class="form-control" name="bookName"
									value="<%=b.getBookName()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Author Name*</label> <input
									type="text" class="form-control" name="authorName"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Price Name*</label> <input type="text"
									class="form-control" name="price" value="<%=b.getPrice()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Book Status</label> <select
									class="form-select" name="status"
									aria-label="Default select example">

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option>Active</option>
									<option>Inactive</option>
									<%
									} else {
									%>
									<option>Inactive</option>
									<option>Active</option>
									<%
									}
									%>


								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>