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
 * Servlet implementation class testerPageServlet
 */
@WebServlet("/testerPageServlet")
public class testerPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public testerPageServlet() {
        super();
    }


    //get session can be null since they just need the url and that would run this
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("tester page get servlet");
		
		HttpSession session = request.getSession();
        if(session.getAttribute("id") == null) {
        	//Not login in so kick them to the login page
        	RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
    		rd.forward(request, response);
        }
        else if(session.getAttribute("type") != "LocationRegServlet") {
        	//not a tester
        	RequestDispatcher rd = request.getRequestDispatcher("home");
    		rd.forward(request, response);
        }
        else
        {
    		try {
	    		String db = "157a_project";
	            String user = "root";
	            String password = "liangjiachang";
	            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
	            Class.forName("com.mysql.jdbc.Driver"); 
	            Statement stmt = con.createStatement();
	
	        	int accountID = (int) session.getAttribute("id");	           
	            
	        	//ONLY ALLOW ON THIS PAGE IF THEIR Adress ID is not null
	        	//need to be fixed
	        	ResultSet rs = stmt.executeQuery("SELECT * FROM 157a_project.`works at` WHERE `Account ID` = "+ accountID + "");
	            if (rs.next() ) {
	            	
	            	ArrayList<Client> clientList = new ArrayList<>();

	            	 int dbAccountID = 0;
	                 int dbAge = 0;
	                 String dbEmail = "";
	                 rs = stmt.executeQuery("SELECT `Account ID`, `Age` FROM 157a_project.`client`");
	                 while (rs.next()) {
	                     dbAccountID = rs.getInt(1);
	                     dbAge = rs.getInt(2);
	                     stmt = con.createStatement();
	                     ResultSet rs2 = stmt.executeQuery("SELECT `Email` FROM 157a_project.`account` WHERE `Account ID` = '"+dbAccountID+"'");
	                     while (rs2.next())
	                     {
	                         dbEmail = rs2.getString(1);
	                     }
	                     
	                     Client c = new Client(dbAccountID, dbEmail, dbAge);
	                     clientList.add(c);
	                 }
	            	
	                request.setAttribute("client", clientList);	
	            	RequestDispatcher rd = request.getRequestDispatcher("testerUserPage.jsp");
	        		rd.forward(request, response);
	            } 
	            else {
	            	RequestDispatcher rd = request.getRequestDispatcher("LocationRegServlet");
	        		rd.forward(request, response);
	            }
	            
	            rs.close();
				stmt.close();
				con.close();
 
	    	}
	    	catch(Exception e) {
				System.out.println(e);
			}
        }
		
		
	}

	
	//Session can never be null here because if it run doPost that mean you login in from somewhere
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("tester page post servlet");
		
		String clientEmail = request.getParameter("clientEmail");
        String dateProcessed = request.getParameter("dateProcessed");
        String dateTested = request.getParameter("dateTested");
        String result = request.getParameter("result");
        
        if (clientEmail == null|| dateProcessed == null || dateTested == null) {
        	doGet(request, response);
        }
        else
        {
        	HttpSession session = request.getSession();
        	String username = (String) session.getAttribute("username");
        	
        	try {
        		String db = "157a_project";
        		String  user = "root";
        		String password = "BasedData420";

        		java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
                Statement stmt = con.createStatement();
                

                String testerEmail = "";
                ResultSet rs = stmt.executeQuery("SELECT `Email` FROM 157a_project.`account` WHERE `Username` = '"+username+"'");
                while (rs.next())
                {
                	testerEmail = rs.getString(1);
                }
                    
                    
                int i = stmt.executeUpdate("INSERT INTO 157a_project.`test result`(`Tester Email`, `Client Email`, `Date Processed`, `Date Tested`, `Result`) values('"+testerEmail+"', '"+clientEmail+"', '"+dateProcessed+"', '"+dateTested+"', '"+result+"')");

                rs = stmt.executeQuery("SELECT `Test ID` FROM 157a_project.`test result` WHERE `Client Email` = '"+clientEmail+"' ORDER BY `Test ID` DESC LIMIT 1");
                int dbTestID = 0;
                int dbAccountID = 0;
                while (rs.next())
                {
                	dbTestID = rs.getInt(1);
                }
                    
                rs = stmt.executeQuery("SELECT `Account ID` FROM 157a_project.`account` WHERE `Email` = '"+clientEmail+"'");
                while (rs.next())
       			{
                	dbAccountID = rs.getInt(1);
       			}
                stmt = con.createStatement();
                i = stmt.executeUpdate("INSERT INTO 157a_project.`has`(`Test ID`, `Account ID`) values('"+dbTestID+"', '"+dbAccountID+"')");
                
                rs.close();
    			stmt.close();
    			con.close();
                
                doGet(request, response);
        		
        	}
        	catch(Exception e) {
        		System.out.println(e);
        	}
        }
		
	}

}
