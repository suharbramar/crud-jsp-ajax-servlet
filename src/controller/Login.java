package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import login.registration.dao.LoginDAO;
//import login.registration.dao.LoginDAOImpl;
//import login.registration.model.Customer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login") 
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession(false); //Fetch session object
		 
        if(session!=null) //If session is not null
         {
             session.invalidate(); //removes all session attributes bound to the session
            
         }
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
       
		System.out.println("Test login saja");
//		LoginDAOImpl ld = new LoginDAOImpl();
//		
//		String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        
//         
//    	Customer c = new Customer();
//    	
//        c.setEmail(email);
//        c.setPassword(password);
//        
//        String userValidate = ld.authenticateUser(c); //Calling authenticateUser function
//        
//        if(userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
//         {
//             request.setAttribute("email", email); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
//             request.getRequestDispatcher("/WEB-INF/views/Home.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
//         }
//         else
//         {
//             request.setAttribute("message", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
//             request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);//forwarding the request
//         }
//        
//        
//        
		
	}

}
