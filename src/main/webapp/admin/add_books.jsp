<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

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
						<h4 class="text-center">Add Books</h4>
						
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failMsg}">
							<h5 class="text-center text-danger">${failMsg}</h5>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							
							<div class="mb-3">
								<label class="form-label">Book Name*</label> <input type="text"
									class="form-control" name="bookName">
							</div>
							<div class="mb-3">
								<label class="form-label">Author Name*</label> <input
									type="text" class="form-control" name="authorName">
							</div>
							<div class="mb-3">
								<label class="form-label">Price Name*</label> <input type="text"
									class="form-control" name="price">
							</div>
							<div class="mb-3">
								<label class="form-label">Book Categories</label> <select
									class="form-select" name="categories" aria-label="Default select example">
									<option selected>---select---</option>
									<option>New</option>
									<option>Old</option>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Book Status</label> <select
									class="form-select" name="status" aria-label="Default select example">
									<option selected>---select---</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Upload Photo</label> <input
									class="form-control" type="file" name="formFile">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>