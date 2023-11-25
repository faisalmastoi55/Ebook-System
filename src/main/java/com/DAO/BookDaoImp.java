package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetls;

public class BookDaoImp implements BookDao {

	private Connection conn;

	public BookDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetls b) {

		Boolean f = false;

		try {

			String query = "insert into book(bookName,author,price,bookCategory,status,photo,email) value(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<BookDetls> getAllBooks() {

		List<BookDetls> list = new ArrayList<BookDetls>();
		BookDetls b = null;

		try {

			String sql = "select * from book";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetls();
				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public BookDetls getBookById(int id) {

		BookDetls b = null;

		try {

			String sql = "select * from book where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditBooks(BookDetls b) {
		boolean f = false;

		try {

			String sql = "update book set bookName=?, author=?, price=?, status=? where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookid());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBook(int id) {

		boolean f = false;

		try {

			String sql = "delete from book where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDetls> getNewBook() {

		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;

			while (rs.next() && i <= 4) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetls> getRecentBook() {
		
		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;

			while (rs.next() && i <= 4) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetls> getOldBook() {
		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;

			while (rs.next() && i <= 4) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetls> getAllRecentBook() {
		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetls> getAllNewBook() {
		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetls> getAllOldBook() {
		List<BookDetls> list = new ArrayList<BookDetls>();

		BookDetls b = null;

		try {

			String sql = "select * from book where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetls> getBookByOld(String email, String cate) {
		
		List<BookDetls> list = new ArrayList<BookDetls>();
		BookDetls b = null;
		
		try {
			
			String sql = "select * from book where bookCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cate, int id) {
		boolean f=false;
		
		try {
			
			String sql = "delete from book where bookCategory=? and email=? and bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<BookDetls> getBookBySearch(String ch) {
		
		List<BookDetls> list = new ArrayList<BookDetls>();
		BookDetls b = null;
		
		try {
			
			String sql = "select * from book where bookName like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDetls();

				b.setBookid(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;

	}
	
	
}
