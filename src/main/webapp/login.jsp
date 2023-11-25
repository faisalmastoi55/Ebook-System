<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="all_component/navbar.jsp"%>

	<!-- start login form -->

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-5">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center">Login:</h2>

						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address:</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password:</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password"
									name="password" required="required">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<a href="register.jsp" class="nav-link">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end Login form -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>