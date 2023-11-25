package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String bookName = req.getParameter("bookName");
			String author = req.getParameter("authorName");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("formFile");
			String fileName = part.getSubmittedFileName();

			
			BookDetls b = new BookDetls(bookName, author, price, categories, status, fileName, "admin");

			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());

			boolean addBooks = dao.addBooks(b);
			HttpSession s = req.getSession();

			if (addBooks) {

				String path = getServletContext().getRealPath("") + "books";
				System.out.println(path);
				File f = new File(path);
				part.write(path + File.separator + fileName);
				
				s.setAttribute("succMsg", "Book Add Successful");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				s.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
