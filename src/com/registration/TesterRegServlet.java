package com.registration;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TesterRegServlet
 */
@WebServlet("/TesterRegServlet")
public class TesterRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TesterRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String repeatedPass = request.getParameter("repeatedpassword");
        String email = request.getParameter("email");
        
        firstName = firstName.replaceAll("\\s","");
        lastName = lastName.replaceAll("\\s","");
        
        //check if password match
        if(!pass.equals(repeatedPass)) {
        	request.setAttribute("error", "Password do not match");
			RequestDispatcher rd = request.getRequestDispatcher("registerPageTester.jsp");
			rd.forward(request, response);
			return;
        }
        
        try {
        	
        	String db = "157a_project";
            String user = "root";
            String password = "liangjiachang";
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
            Statement stmt = con.createStatement();
        
            //Check if username is taken
            ResultSet rs = stmt.executeQuery("SELECT Username FROM 157a_project.`account` WHERE Username = '" + username +"' Limit 1");
            String dbUsername = "";
            while (rs.next()) {
                dbUsername = rs.getString(1);
            }  
            if(dbUsername.equals(username)) {
            	request.setAttribute("error", "Username taken");
    			RequestDispatcher rd = request.getRequestDispatcher("registerPageTester.jsp");
    			rd.forward(request, response);
    			return;
            }
            
            
            //check if email is taken
            rs = stmt.executeQuery("SELECT Email FROM 157a_project.`account` WHERE Email = '" + email +"' Limit 1");
            String dbEmail = "";
            while (rs.next()) {
            	dbEmail = rs.getString(1);
            }
            if(dbEmail.equals(email)) {
            	request.setAttribute("error", "Email taken");
    			RequestDispatcher rd = request.getRequestDispatcher("registerPageTester.jsp");
    			rd.forward(request, response);
    			return;
            }
            
            int i = stmt.executeUpdate("INSERT INTO 157a_project.`account`(Email, Username, Password) values('"+email+"', '"+username+"', '"+pass+"')");
            
            rs = stmt.executeQuery("SELECT `Account ID` FROM 157a_project.`account` WHERE Email = '"+email+"' Limit 1");
            int accountID = 0;
            while (rs.next()) {
                accountID = rs.getInt(1);
            }
 
            String testerName = firstName + " " + lastName;
            i = stmt.executeUpdate("INSERT INTO 157a_project.`tester`(`Account ID`, `Tester Name`, `Verified`) values('"+accountID+"', '"+testerName+"', '0')");
            
            rs.close();
			stmt.close();
			con.close();
			
			request.setAttribute("success", "Registration Successful, Please Wait Until Your Account is Verified By An Admin");
			RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
			rd.forward(request, response);
			
        }  
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
		
		
	}

}
