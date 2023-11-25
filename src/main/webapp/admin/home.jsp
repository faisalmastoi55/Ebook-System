<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Home</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.card {
	position: relative;
	width: 200px;
	height: 160px;
	border-radius: 14px;
	z-index: 1111;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	box-shadow: 20px 20px 60px #bebebe, -20px -20px 60px #ffffff;
	;
}

.bg {
	position: absolute;
	top: 5px;
	left: 5px;
	width: 190px;
	height: 149px;
	z-index: 2;
	background: rgba(255, 255, 255, .95);
	backdrop-filter: blur(24px);
	border-radius: 10px;
	overflow: hidden;
	outline: 2px solid white;
}

.blob {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-color: #01579b;
	opacity: 1;
	filter: blur(12px);
	animation: blob-bounce 5s infinite ease;
}

@keyframes blob-bounce {
  0% {
    transform: translate(-100%, -100%) translate3d(0, 0, 0);
  }

  25% {
    transform: translate(-100%, -100%) translate3d(100%, 0, 0);
  }

  50% {
    transform: translate(-100%, -100%) translate3d(100%, 100%, 0);
  }

  75% {
    transform: translate(-100%, -100%) translate3d(0, 100%, 0);
  }

  100% {
    transform: translate(-100%, -100%) translate3d(0, 0, 0);
  }
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center mb-5">Hello, Admin</h3>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card mb-2">
						<div class="card-body text-center bg">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i>
							<h4>Add Books</h4>
							----------
						</div>
						<div class="blob"></div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card mb-2">
						<div class="card-body text-center bg">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i>
							<h4>All Books</h4>
							----------
						</div>
						<div class="blob"></div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card mb-2">
						<div class="card-body text-center bg">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i>
							<h4>Order</h4>
							----------
						</div>
						<div class="blob"></div>
					</div>
				</a>
			</div>
			<div class="col-md-3 mb-5">
				<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center bg">
							<i
								class="fa-sharp fa-solid fa-right-from-bracket fa-3x text-primary"></i>
							<h4>Logout</h4>
							----------
						</div>
						<div class="blob"></div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- Logout Model -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body text-center py-5">
				<h2 class="mb-3 fw-bold" style="color: #545454;">Do you want logout</h2>
				<button type="button" class="btn btn-dark text-white"
					data-bs-dismiss="modal">Close</button>
				<a href="../logout" class="btn btn-dark text-white">Logout</a>

			</div>
		</div>
	</div>
</div>


<!-- End Logout Model -->
	
	
	<%@include file="footer.jsp"%>
</body>
</html>