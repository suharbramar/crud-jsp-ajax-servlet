package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CustomerDAO;
import dao.CustomerDAOImpl;
import model.Customer;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/RegisterFrm")
public class RegisterFrm extends HttpServlet { 
	private static final long serialVersionUID = 1L;
	private static int stat = 0;
       
    /**
     * @see HttpServlet#HttpServlet() 
     */
    public RegisterFrm() { 
        super(); 
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		/*
		 * String greetings = "Hello Ajax";
		 * 
		 * response.setContentType("text/plain"); response.getWriter().write(greetings);
		 */
		
	    //request.setAttribute("ListCustomer", cd.getAllCustomer());  
	 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/RegisterFrm.jsp");
		dispatcher.forward(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CustomerDAO cd = new CustomerDAOImpl(); 
		
        int customerId = Integer.parseInt(request.getParameter("AccountId"));
		String customerName = request.getParameter("CustomerName");
		
		System.out.println("Customer :" +customerName);
		Customer cust = new Customer();
		
		cust.setCustomerId(customerId);
		cust.setCustomerName(customerName);

		stat = cd.insertCustomer(cust);
		
		System.out.print("MySQL Code : "+stat);
		
		if (stat == 1) {
		    
			//String message = "Add customer successfully ";
			
			Customer MyCust = new Customer();
			MyCust = cd.getCustomer(customerId);
			      
			request.setAttribute("Method", "POST"); 
			request.setAttribute("CustomerId", MyCust.getCustomerId()); 
			request.setAttribute("CustomerName", MyCust.getCustomerName()); 
			
			
		    //request.setAttribute("msg", message);
			request.setAttribute("Stat",stat);
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/CustomerFrm.jsp");
			dispatcher.forward(request, response);
			
		}else {		
			//response.sendRedirect("Welcome.jsp");
			//String message = "Add customer Failed || Error Code : "+stat;
			request.setAttribute("Stat",stat);
		    
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/CustomerFrm.jsp");
			dispatcher.forward(request, response);
			
		}
			
	 
		
		//int count = 0;
        //System.out.println("COUNT : "+count++);
		
		
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
