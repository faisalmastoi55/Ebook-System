<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book Page</title>

<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Sell Old Book</h4>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failMsg}">
							<h5 class="text-center text-danger">${failMsg}</h5>
							<c:remove var="failMsg" scope="session" />
						</c:if>

						<form action="add_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email }" name="user">

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
								<label class="form-label">Upload Photo</label> <input
									class="form-control" type="file" name="formFile">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>