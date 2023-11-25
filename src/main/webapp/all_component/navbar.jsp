<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<div class="container-fluid"
	style="height: 10px; background-color: #01579b"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h2 class="text-success fw-bold">
				<i class="fa-solid fa-book"></i> E-Book
			</h2>
		</div>
		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2 w-50" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3" id="btnLR">

				<a href="checkout.jsp" class="p-1"><i class="fas fa-cart-plus fa-2x"></i></a>

				<a href="login.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> ${userobj.name }</a> <a
					href="logout" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</div>
		</c:if>
		<c:if test="${empty userobj }">
			<div class="col-md-3" id="btnLR">
				<a href="login.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Login</a> <a href="register.jsp"
					class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i>
					Register</a>
			</div>
		</c:if>

	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-navbar-color">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item "><a class="nav-link active"
					href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item "><a class="nav-link active"
					href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
						New Book</a></li>
				<li class="nav-item "><a class="nav-link active"
					href="all_old_book.jsp"><i class="fa-solid fa-book"></i> Old
						Book</a></li>
			</ul>
			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light me-2" type="submit">
					<i class="fa-solid fa-gear"></i> Setting
				</a>
				<button class="btn btn-light" type="submit">
					<i class="fa-solid fa-address-card"></i> Contact Us
				</button>
			</form>
		</div>
	</div>
</nav>