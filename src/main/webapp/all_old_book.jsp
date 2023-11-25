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

	<%@include file="all_component/navbar.jsp"%>

	<div class="conatiner">
		<div class="row p-3 m-0">
			<%
			BookDaoImp dao3 = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list3 = dao3.getAllOldBook();

			for (BookDetls b : list3) {
			%>

			<div class="col-md-3" id="cards">
				<div class="card crd mt-3">
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
	</div>

</body>
</html>