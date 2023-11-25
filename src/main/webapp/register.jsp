<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<!-- start register form -->

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center">Registration</h2>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputName1" class="form-label">Name*</label>
								<input type="text" class="form-control" id="exampleInputName1"
									required="required" name="username">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address*</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="useremail">
							</div>
							<div class="mb-3">
								<label for="exampleInputNumber1" class="form-label">Phone*</label>
								<input type="number" class="form-control"
									id="exampleInputNumber1" required="required" name="phoneNo">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password*</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end register form -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>