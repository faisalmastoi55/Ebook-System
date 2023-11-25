<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		$(document).ready(function() {
			showToast("${addCart}");
		});

		function showToast(content) {
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(() => {
				$("#toast").removeClass("display");
			}, 2000);
		}
	</script>
		<c:remove var="addCart" scope="session" />

	</c:if>


	<%@include file="all_component/navbar.jsp"%>

	<div class="conatiner">
		<div class="row p-3 m-0">
			<%
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			List<BookDetls> list = dao.getAllNewBook();

			for (BookDetls b : list) {
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
	</div>

</body>
</html>