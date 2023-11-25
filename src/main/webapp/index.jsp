<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook : index</title>

<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.back-img {
	background-image: url("img/b.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd:hover {
	background-color: #fcf7f7;
}

@media ( max-width :540px) {
	#btnLR {
		margin-top: 10px;
	}
	#cards {
		margin-bottom: 5px;
	}
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User)session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center fw-bold p-2 title" style="color: #01579b">Ebook
			Management System</h2>
	</div>

	<!-- Start Recent Books -->

	<div class="container">
		<h3 class="text-center py-4">Recent Books</h3>
		<div class="row">

			<%
			BookDaoImp dao2 = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list2 = dao2.getRecentBook();

			for (BookDetls b : list2) {
			%>

			<div class="col-md-3" id="cards">
				<div class="card crd">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							<%=b.getBookName()%>
						</p>
						<p>
							<%=b.getAuthor()%>
						</p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Categories :
							<%=b.getBookCategory()%></p>

						<div>
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success">View</a> <a href="#"
								class="btn btn-danger"><%=b.getPrice()%></a>
						</div>

						<%
						} else {
						%>

						<p>
							Categories :
							<%=b.getBookCategory()%></p>
						<div>

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger"><i
								class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger"><i
								class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>


							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success">View</a> <a href="#"
								class="btn btn-danger"><%=b.getPrice()%></a>
						</div>

						<%
						}
						%>


					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-3">
			<a href="all_recent_book.jsp" class="btn btn-danger">View All</a>
		</div>

	</div>
	<!-- End Recent Books -->

	<hr>

	<!-- Start New Books -->

	<div class="container">
		<h3 class="text-center py-4">New Books</h3>
		<div class="row">


			<%
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list = dao.getNewBook();

			for (BookDetls b : list) {
			%>

			<div class="col-md-3" id="cards">
				<div class="card crd">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories :
							<%=b.getBookCategory()%></p>
						<div>

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger"><i
								class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger"><i
								class="fa-sharp fa-solid fa-cart-plus"></i>Add Cart</a>


							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success">View</a> <a href="#"
								class="btn btn-danger"> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger">View All</a>
		</div>

	</div>
	<!-- End New Books -->

	<hr>

	<!-- Start Old Books -->

	<div class="container">
		<h3 class="text-center py-4">Old Books</h3>
		<div class="row">
			<%
			BookDaoImp dao3 = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list3 = dao3.getOldBook();

			for (BookDetls b : list3) {
			%>

			<div class="col-md-3" id="cards">
				<div class="card crd">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories :
							<%=b.getBookCategory()%></p>
						<div>
							<a href="view_books.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success">View</a> <a href="#"
								class="btn btn-danger"> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger">View All</a>
		</div>

	</div>
	<!-- End Old Books -->

	<!-- Footer -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>