package dao;

import java.util.List;

import model.Customer;

public interface CustomerDAO {

	public int insertCustomer(Customer c);
	public Customer getCustomer(int customer_id);
	public List<Customer> getAllCustomer();
}
