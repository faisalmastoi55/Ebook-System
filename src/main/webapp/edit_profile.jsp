<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile Page</title>

<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="update_profile" method="post">
							<input type="hidden" name="id" value="${userobj.id }">

							<div class="mb-3">
								<label class="form-label">Name*</label> <input type="text"
									class="form-control" name="name" value="${userobj.name }">
							</div>
							<div class="mb-3">
								<label class="form-label">Email Address*</label> <input
									type="email" class="form-control" name="email" value="${userobj.email }">
							</div>
							<div class="mb-3">
								<label class="form-label">Phone*</label> <input type="text"
									class="form-control" name="phone" value="${userobj.phoneNo }">
							</div>
							<div class="mb-3">
								<label class="form-label">Password*</label> <input
									type="password" class="form-control" name="password">
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