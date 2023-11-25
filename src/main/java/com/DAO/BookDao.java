package com.DAO;

import java.util.List;

import com.entity.BookDetls;

public interface BookDao {

	public boolean addBooks(BookDetls b);
	
	public List<BookDetls> getAllBooks();
	
	public BookDetls getBookById(int id);
	
	public boolean updateEditBooks(BookDetls b);
	
	public boolean deleteBook(int id);
	
	public List<BookDetls> getNewBook();
	
	public List<BookDetls> getRecentBook();
	
	public List<BookDetls> getOldBook();
	
	public List<BookDetls> getAllRecentBook();
	
	public List<BookDetls> getAllNewBook();
	
	public List<BookDetls> getAllOldBook();
	
	public List<BookDetls> getBookByOld(String email, String cate);
	
	public boolean oldBookDelete(String email, String cate, int id);
	
	public List<BookDetls> getBookBySearch(String ch);
	
}
