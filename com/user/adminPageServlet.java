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

/**
 * Servlet implementation class adminPageServlet
 */
@WebServlet("/adminPageServlet")
public class adminPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String db = "157a_project";
		String user = "root";
		String password = "liangjiachang";
		
		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT `Account ID`,`Tester Name`, `Email` FROM 157a_project.`tester` JOIN 157a_project.`account` USING(`Account ID`) WHERE `Verified` = '0'");
			
			ArrayList<UnverifiedUser> myList = new ArrayList<>();	
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getNString(2);
				String email = rs.getNString(3);			
				UnverifiedUser u = new UnverifiedUser(id, name, email);
				myList.add(u);
			}

			rs.close();
			stmt.close();
			con.close();
			
			request.setAttribute("UnverifiedUsers", myList);
			RequestDispatcher rd = request.getRequestDispatcher("adminUserPage.jsp");
			rd.forward(request, response);
			
		} 
		catch(Exception e) {
			System.out.println("Exception caught: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("Name");
		
		if(email != null) {
			String db = "157a_project";
			String user = "root";
			String password = "liangjiachang";
			
			try {
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("SELECT `Account ID` FROM 157a_project.`tester` JOIN 157a_project.`account` USING(`Account ID`) WHERE Email = '"+ email +"' LIMIT 1");
				
				int accountID = -1;	
				while (rs.next()) {
					accountID = rs.getInt(1);
				}
				
				String statement = "";
				if(accountID > 0) {
					int i = stmt.executeUpdate("UPDATE 157a_project.`tester` SET Verified = '1' WHERE `Account ID` = "+accountID+"");
					statement = "Successfully Verified";
				}
				else {
					statement = "This user is not in the database";
				}
				
				rs.close();
				stmt.close();
				con.close();
				
				request.setAttribute("message", statement);
			}
			catch(Exception e) {
				System.out.println("Exception caught: " + e.getMessage());
			}
		}
		doGet(request, response);
	}

}
