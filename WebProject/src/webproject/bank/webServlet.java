package webproject.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class webServlet
 */
@WebServlet("/webServlet")
public class webServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public webServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	
    	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "12345";
		
		//loading driver
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//getting connection
		
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(con);
    	
		

    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//know what page we are on
		HttpSession session = request.getSession();
		String pageValue = (String)session.getAttribute("value");
		
		
		//Controls the executive Login
		if(pageValue.equalsIgnoreCase("execLogIn")){
			
			
			//pull parameters from jsp
			String uName = request.getParameter("uname");
			String password = request.getParameter("psw");
			
			boolean exists = false;
			
			//call method
			try {
				exists = dbController.isValidCredentials(Integer.parseInt(uName), password, con);
				
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println(e.getMessage());
			}
			
			//redirect to new pages
			if(exists){
				response.sendRedirect("CustomerRegistration.jsp");
			}else{
				response.sendRedirect("testFailed.jsp");
			}

		//Controls creation of a new Customer	
		}else if(pageValue.equalsIgnoreCase("custRegistration")){
			
			//Checks to see what button was pressed
			String act = request.getParameter("regBtns");
			if (act == null) {
			    //no button has been selected
			} else if (act.equals("submit")) {
			    //submit button was pressed
				String customerId = request.getParameter("customerId");
				String customerName = request.getParameter("customerName");
				String customerAge = request.getParameter("customerAge");
				String adr1 = request.getParameter("customerAddress1");
				String adr2 = request.getParameter("customerAddress2");
				String city = request.getParameter("customerCity");
				String state = request.getParameter("customerState");
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				System.out.println(dtf.format(now));  
				
				try {
					dbController.createCustomer(Integer.parseInt(customerId), customerName, Integer.parseInt(customerAge), adr1, adr2, city, state, null, null, dtf.format(now), con);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e.getMessage());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				
				response.sendRedirect("testSuccess.jsp");
				
			} else if (act.equals("mainmenu")) {
			    //mainmenu button was pressed
				response.sendRedirect("mainMenu.jsp");
			} else {
			    //someone has altered the HTML and sent a different value!
			}
			
		}

	}
}
