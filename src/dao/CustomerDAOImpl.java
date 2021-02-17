package dao;


import java.io.IOException;
import java.lang.annotation.Annotation;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.MyConnectionProvider;
import model.Customer;


public class CustomerDAOImpl implements CustomerDAO {

	/* JDBC SETTING */
    Connection con;
	static PreparedStatement ps;
	private int SQLErrorCode;
	@Override
	public int insertCustomer(Customer c) {

//		Session session = HibernateUtil.getSessionFactory();
//		
//		if(session != null) {
//			try{ 
////				//start transaction
////				transaction = session.beginTransaction();
////				
//				//save the object 
//				session.save(c);
//				session.beginTransaction().commit();
//				
//				//commit transaction
//				//transaction.commit();
//				
//				
//			}catch(Exception e) {
//				System.out.println("Exception occred while reading user data: "
//					      + e.getMessage());
//			     session.beginTransaction().rollback();
////				if(transaction != null) {
////					transaction.rollback();
////				}
//			  e.printStackTrace();	
//			}
//		}
//		
//		
//		return 1;
/*================== MENGGUNAKAN JDBC =============*/		
	    SQLErrorCode =0;
		
		try {
			con = MyConnectionProvider.getCon();
			con.setAutoCommit(false);
			
			CallableStatement statement = con.prepareCall("{call input_customer(?, ?)}");
			statement.setInt(1, c.getCustomerId());
	        statement.setString(2, c.getCustomerName());
	 
	        //statement.execute();
	        int stat = statement.executeUpdate();
	        statement.close();
	 
	        System.out.println("Stored procedure called successfully! _stat "+stat);
	            
			con.commit();
			con.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
			
			SQLErrorCode = e.getErrorCode();
			
			return SQLErrorCode;
	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
		
		// TODO Auto-generated method stub
		return 1;
	}

	@Override
	public Customer getCustomer(int customer_id) {
		Customer cust = new Customer();
		
		try {
			try {
				con = MyConnectionProvider.getCon();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ps = con.prepareStatement("SELECT CUSTOMER_ID, CUSTOMER_NAME FROM "
					+ " T_CUSTOMER WHERE CUSTOMER_ID = ? ORDER BY CUSTOMER_ID ASC");
			ps.setInt(1, customer_id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cust.setCustomerId(rs.getInt(1));
				cust.setCustomerName(rs.getString(2));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return cust;
	}
	
	@Override
	public List<Customer> getAllCustomer() {
		Customer cust = null;	
		List<Customer> ListCust = new ArrayList<Customer>();
		try {
			try {
				con = MyConnectionProvider.getCon();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ps = con.prepareStatement("SELECT CUSTOMER_ID, CUSTOMER_NAME FROM "
					+ " T_CUSTOMER ORDER BY CUSTOMER_ID ASC");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				/*
				 * cust = new Customer();
				 * 
				 * cust.setCustomerId(rs.getInt(1)); cust.setCustomerName(rs.getString(2));
				 */
				
				ListCust.add(new Customer(rs.getInt(1),rs.getString(2)));
			}
			
		}catch(SQLException e) {
			
		}
		// TODO Auto-generated method stub
		return ListCust;
	}

}
