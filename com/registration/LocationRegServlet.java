package com.registration;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LocationRegServlet
 */
@WebServlet("/LocationRegServlet")
public class LocationRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LocationRegServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("LOCATION REG GET");
    	
    	HttpSession session = request.getSession();
        if(session.getAttribute("id") == null) {
        	//Not login in so kick them to the login page
        	RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
    		rd.forward(request, response);
        }
        else if (session.getAttribute("type") != "LocationRegServlet"){
        	//Not a tester
        	RequestDispatcher rd = request.getRequestDispatcher("home");
    		rd.forward(request, response);
        }
        else{

	    	try {
	    		String db = "157a_project";
	            String user = "root";
	            String password = "liangjiachang";
	            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
	            Class.forName("com.mysql.jdbc.Driver"); 
	            Statement stmt = con.createStatement();
	
	        	int accountID = (int) session.getAttribute("id");	
	            
	            //to be fix
	            ResultSet rs = stmt.executeQuery("SELECT * FROM 157a_project.`works at` WHERE `Account ID` = "+ accountID + "");
	            
	            //They already have a location
	            if (rs.next() ) {
	            	System.out.println("GOING TO TESTER PAGE");
	            	RequestDispatcher rd = request.getRequestDispatcher("testerPageServlet");
	        		rd.forward(request, response);
	            } 
	            else {
	            	System.out.println("GOING TO LOCATION REG PAGE");
	            	RequestDispatcher rd = request.getRequestDispatcher("registerPageLocation.jsp");
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("LOCATION POST GET");
		
        String locationName = request.getParameter("testingLocation");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String appointments = request.getParameter("appointments");
        String drivethrough = request.getParameter("drivethrough");
        String openhours = request.getParameter("hours");
        String turnaround = request.getParameter("turnaround");
        String phone = request.getParameter("phone");
        String url = request.getParameter("url");
        String body = request.getParameter("paragraph_text");
		
        
        if (locationName == null || address == null  || city == null  || zipcode == null)
        {
        	doGet(request, response);
        }
        else {
		
			try {
				
				String db = "157a_project";
	            String user = "root";
	            String password = "BasedData420";
	            java.sql.Connection con; 
	            Class.forName("com.mysql.jdbc.Driver"); 
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
	            Statement stmt = con.createStatement();
				
	            
	            //get account id from session
	        	HttpSession session = request.getSession();
	        	int accountID = (int) session.getAttribute("id");	
	            
	            //check if location exist
	        	System.out.println("Location Check");
				int dbLocationID = -1;
	            ResultSet rs = stmt.executeQuery("SELECT `Location ID`, `Name` FROM 157a_project.`testing location` WHERE Name = '"+locationName+"'");
	            while (rs.next()) {
	                dbLocationID = rs.getInt(1);
	            }
	            
	            
	            //Location is not in db
	            if(dbLocationID == -1) {
	            	int i = stmt.executeUpdate("INSERT INTO 157a_project.`testing location`(`Name`, `Appointments`, `Drive Through`, `Open Hours`, `Turnaround Time`, `Phone`, `URL`) values('"+locationName+"', '"+appointments+"', '"+drivethrough+"', '"+openhours+"', '"+turnaround+"', '"+phone+"', '"+url+"')");            	
	            	
	            	//Deal with find the city
	            	int dbCity = -1;
	            	rs = stmt.executeQuery("SELECT `City ID` FROM 157a_project.`city` WHERE Name = '"+city+"'");
	                while (rs.next()) {
	                    dbCity = rs.getInt(1);
	                }
	                if (dbCity == -1)
	                {
	                    i = stmt.executeUpdate("INSERT INTO 157a_project.`city`(Name) values('"+city+"')");
	                    rs = stmt.executeQuery("SELECT `City ID` FROM 157a_project.`city` WHERE Name = '"+city+"'");
	                    while (rs.next()) {
	                        dbCity = rs.getInt(1);
	                    }
	                }
	            	
	        
	                //Deal with find the state
	                int dbState = -1;
	                rs = stmt.executeQuery("SELECT `State ID` FROM 157a_project.`state` WHERE Name = '"+state+"'");
	                while (rs.next()) {
	                    dbState = rs.getInt(1);
	                }
	            	
	                
	                rs = stmt.executeQuery("SELECT `Location ID` FROM 157a_project.`testing location` WHERE Name = '"+locationName+"'");
	                while (rs.next()) {
	                    dbLocationID = rs.getInt(1);
	                }
	                
	                
	                String fullAddress = address + ", " + city + ", " + state + " " + zipcode;
	                i = stmt.executeUpdate("INSERT INTO 157a_project.`address`(`Location ID`, `State ID`, `City ID`, `Zip Code`, `Address`) values('"+dbLocationID+"', '"+dbState+"', '"+dbCity+"', '"+zipcode+"', '"+fullAddress+"')");

	                
	                i = stmt.executeUpdate("INSERT INTO 157a_project.`post`(`Body`) values('"+body+"')");
	                
	                //get the newest post
	                int dbPostID = 0;
	                stmt = con.createStatement();
	                rs = stmt.executeQuery("SELECT `Post ID` FROM 157a_project.`Post` ORDER BY `Post ID` DESC LIMIT 1");           
	                while (rs.next()) {
	                    dbPostID = rs.getInt(1);
	                }
	               
	                
	                i = stmt.executeUpdate("INSERT INTO 157a_project.`create post`(`Account ID`, `Post ID`) values('"+accountID+"', '"+dbPostID+"')");
	                
	                i = stmt.executeUpdate("INSERT INTO 157a_project.`at`(`Post ID`, `Location ID`) values('"+dbPostID+"', '"+dbLocationID+"')");
	                
	         
	                //Need to be fix
	                i = stmt.executeUpdate("INSERT INTO 157a_project.`works at`(`Account ID`, `Location ID`) values('"+accountID+"', '"+dbLocationID+"')");
	                
	            }
	            else
	            {
	            	//need to be fix
	                int i = stmt.executeUpdate("INSERT INTO 157a_project.`works at`(`Account ID`, `Location ID`) values('"+accountID+"', '"+dbLocationID+"')");
	                RequestDispatcher rd = request.getRequestDispatcher("testerPageServlet");
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
}
