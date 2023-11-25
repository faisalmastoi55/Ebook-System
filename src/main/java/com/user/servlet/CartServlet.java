package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DAO.CartDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDaoImp dao = new BookDaoImp(DBConnect.getConn());
			BookDetls b = dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDaoImp dao2 = new CartDaoImp(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Book Add  to cart");
				resp.sendRedirect("all_new_book.jsp");
			}else {
				session.setAttribute("failed", "Something went wrong on server");
				resp.sendRedirect("all_new_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	
}
