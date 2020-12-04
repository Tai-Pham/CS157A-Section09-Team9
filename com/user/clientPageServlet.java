package com.user;

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

/**
 * Servlet implementation class clientPageServlet
 */
@WebServlet("/clientPageServlet")
public class clientPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public clientPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet");
		
		HttpSession session = request.getSession();
        if(session.getAttribute("id") == null) {
        	//Not login in so kick them to the login page
        	RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
    		rd.forward(request, response);
        }
        else if(session.getAttribute("type") != "clientPageServlet") {
        	//not a tester
        	RequestDispatcher rd = request.getRequestDispatcher("home");
    		rd.forward(request, response);
        }
        else
        {
        	try {
        		String db = "157a_project";
	            String user = "root";
	            String password = "BasedData420";
	            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
	            Class.forName("com.mysql.jdbc.Driver"); 
	            Statement stmt = con.createStatement();
	            
	            String email = (String) session.getAttribute("email");
	            ArrayList<Result> resultList = new ArrayList<>();
	            
	            
	            ResultSet rs = stmt.executeQuery("SELECT * FROM 157a_project.`test result` WHERE `Client Email` = '" + email + "'");
	            while (rs.next()) {
	            	
	            	String tester_email = rs.getString(2);
					String date_processed = rs.getString(4);
					String date_tested = rs.getString(5);
					String result = rs.getString(6);
					
					int accountID = 0;
					stmt = con.createStatement();
					String statement = "Select `Account ID` from 157a_project.`account` WHERE `email` = '"+tester_email+"' LIMIT 1";
					ResultSet rs2 = stmt.executeQuery(statement);
					
					while(rs2.next()) {
						accountID = rs2.getInt(1);
					}
					
					
					statement = "SELECT `name` FROM 157a_project.tester JOIN 157a_project.`works at` USING(`Account id`) JOIN 157a_project.`testing location` USING(`location ID`) WHERE `Account ID` = "+accountID+"";
					stmt = con.createStatement();
					rs2 = stmt.executeQuery(statement);
					
					String name = "";
					while(rs2.next()) {
						name = rs2.getString(1);
					}
					
					Result r = new Result(name, tester_email, date_tested, date_processed,  result);
					resultList.add(r);
					
	            }
	            
	            
	            con.close();
	            
	            if(resultList.size() == 0) {
	            	request.setAttribute("nothing", "You have not been tested");	
	            }
	            else {
	            	request.setAttribute("results", resultList);	
	            }
	            	
            	RequestDispatcher rd = request.getRequestDispatcher("clientUserPage.jsp");
        		rd.forward(request, response);
	            
	            
	    	}
	    	catch(Exception e) {
				System.out.println(e);
			}
		
		
        }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doGet(request, response);
	}

}
