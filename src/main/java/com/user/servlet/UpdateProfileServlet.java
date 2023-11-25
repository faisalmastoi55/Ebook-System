package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneNo = req.getParameter("phone");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhoneNo(phoneNo);
			
			HttpSession session = req.getSession();
			UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			
			if (f) {
				
				boolean b = dao.updateProfile(us);
				if (b) {
					session.setAttribute("succMsg", "Profile Update Successfully..");
					resp.sendRedirect("edit_profile.jsp");
					
				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("edit_profile.jsp");
				}
				
				User us1 = new User();
				us1.setId(id);
				us1.setName(name);
				us1.setEmail(email);
				us1.setPhoneNo(phoneNo);
				
			} else {
				session.setAttribute("failedMsg", "Your Password Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
