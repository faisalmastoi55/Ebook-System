package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImpl implements UserDao {

	private Connection conn;

	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	public boolean userRegister(User us) {

		boolean f = false;
		try {
			String query = "insert into user(name,email,phoneNo,password) values(?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, us.getName());
			psmt.setString(2, us.getEmail());
			psmt.setString(3, us.getPhoneNo());
			psmt.setString(4, us.getPassword());

			int i = psmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	
	public User login(String email, String password) {
		User us = null;
		try {
			 String query = "select * from  user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneNo(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandMark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPinCode(rs.getString(10));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;
	}


	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		
		try {
			
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public boolean updateProfile(User us) {
		
		boolean f = false;
		try {
			String query = "update user set name=?, email=?, phoneNo=? where id=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, us.getName());
			psmt.setString(2, us.getEmail());
			psmt.setString(3, us.getPhoneNo());
			psmt.setInt(4, us.getId());

			int i = psmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}


	@Override
	public boolean checkUser(String em) {
		boolean f=true;
		
		try {
			
			String query = "select * from user where email=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, em);
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next())
			{
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}	
}
