<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>

<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.crd:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body>

	<%
	User u = (User)session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="conatiner">
		<div class="row p-3 m-0">
			<%
			BookDaoImp dao2 = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list2 = dao2.getAllRecentBook();

			for (BookDetls b : list2) {
			%>

			<div class="col-md-3" id="cards">
				<div class="card crd mt-3">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
	</div>

</body>
</html>