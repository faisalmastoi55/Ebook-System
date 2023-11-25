<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address Page</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 mt-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Address</h4>
						<form action="" class="row">
							<div class="col-md-6 mb-3">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address">
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label">Landmark</label> <input type="text"
									class="form-control">
							</div>
							<div class="col-md-4">
								<label class="form-label">City</label> <input type="text"
									class="form-control">
							</div>
							<div class="col-md-4">
								<label class="form-label">State</label> <input type="text"
									class="form-control">
							</div>
							<div class="col-md-4">
								<label class="form-label">Zip</label> <input type="number"
									class="form-control">
							</div>
							<div class="container text-center py-3">
								<button class="btn btn-warning">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>