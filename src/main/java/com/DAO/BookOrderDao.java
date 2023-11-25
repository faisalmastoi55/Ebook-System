package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDao {
	
	public boolean saveOrder(List<Book_Order> order);
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllBookOrder();
	
}
