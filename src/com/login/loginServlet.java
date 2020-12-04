package com.login;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.LocationInfo;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("accountType");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		 String dbUsername = "";
         String dbPassword = "";
         int accountID = 0;
         String dbemail = "";
		
		try {	
			String db = "157a_project";
	        String user = "root"; 
	        String dbpass = "liangjiachang";
			
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, dbpass);
			
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT `Account ID`, Username, Password, Email FROM 157a_project.`account` WHERE Username = '"+username+"' AND Password = '"+password+"'");
            while (rs.next()) {
            	accountID = rs.getInt(1);
                dbUsername = rs.getString(2);
                dbPassword = rs.getString(3);
                dbemail = rs.getString(4);
            }
            
            //if the id is still 0 that mean nothing was found
            if(accountID == 0) {
            	request.setAttribute("error", "Password or Username is incorrect");
    			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
    			rd.forward(request, response);

            }
            else {
            	
            	//password and username are correct so check the account type
            	if(username.equals(dbUsername) && password.equals(dbPassword))
            	{
		            String statement = "";
		            switch(type) {
		            	case "Client":
		            		statement = "SELECT * FROM 157a_project.`client` WHERE `Account ID` = "+ accountID +" LIMIT 1";
		            		break;	
		            	case "Tester":
		            		//Need to make sure the account is Verified before the tester can log in
		            		statement = "SELECT * FROM 157a_project.`tester` WHERE `Account ID` = "+ accountID +" AND `Verified` = 1 LIMIT 1";
		            		break;		
		            	case "Admin":
		            		statement = "SELECT * FROM 157a_project.`admin` WHERE `Account ID` = "+ accountID +" LIMIT 1";
		            		break;
		            }
		            
		            //This will return only one thing because of Limit 1
		            rs = stmt.executeQuery(statement);
		            
		            
		            //No data
		            if (!rs.next() ) {    
		            	request.setAttribute("error", "Password or Username is incorrect. Or this account isn't Verified Yet");
		    			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
		    			rd.forward(request, response);
		            }
		            else {	            	   	
		            	type = type.toLowerCase();
		            	HttpSession session = request.getSession();
	            		session.setAttribute("id", accountID);
	            		session.setAttribute("username", dbUsername);
	            		session.setAttribute("email", dbemail);
		            	
		            	String url = "";
		            	if(type.equals("client")) {
		            		System.out.println("Client");
		            		url = "clientPageServlet";
		            		session.setAttribute("type", url);
		            	}
		            	else if(type.equals("tester")) {
		            		System.out.println("Tester");
		            		url = "LocationRegServlet";
		            		session.setAttribute("type", url);
		            	}
		            	else{
		            		System.out.println("admin");
		            		url = "adminPageServlet";
		            		session.setAttribute("type", url);
		            	}
		            	
		            	RequestDispatcher rd = request.getRequestDispatcher(url);
	        			rd.forward(request, response);	
	
		            }
            	}
            }
            
            rs.close();
			stmt.close();
			con.close();
                      
		} catch(Exception e) {
			System.out.println("Exception caught: " + e.getMessage());
		}
		
	}

}
