package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetls;

@WebServlet("/editbooks")
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bookName");
			String author = req.getParameter("authorName");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			BookDetls b = new BookDetls();
			b.setBookid(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			if (f) {
				
				session.setAttribute("succMsg", "Book Update Successfully");
				resp.sendRedirect("admin/all_books.jsp");
				
			}else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	
}
