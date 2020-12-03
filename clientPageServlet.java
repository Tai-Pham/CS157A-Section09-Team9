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
	 /**
	  * @see HttpServlet#HttpServlet()
	  */
	 public clientPageServlet() {
	     super();
	     // TODO Auto-generated constructor stub
	 }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("username");
		String db = "cs157a";
		String user = "root";
		String password = "password";

		String client_email = "";

		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);
            
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT `email` FROM cs157a.`account` WHERE `Username` = '" + username + "';");
			
			while (rs.next()) {
				client_email = rs.getString(1);
			}

			rs.close();
			stmt.close();
			con.close();

		} catch(Exception e) { 
			System.out.println("Exception caught: " + e.getMessage()); 
		}

		System.out.println(client_email);
		
		int id;
		String tester_email, date_processed, date_tested;
		boolean result;

		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM cs157a.`test` WHERE `Client Email` = '" + client_email + "';");

			ArrayList<Result> myList = new ArrayList<>();
			while(rs.next()) {
				id = rs.getInt(1);
				tester_email = rs.getString(2);
				date_processed = rs.getString(4);
				date_tested = rs.getString(5);
				result = rs.getBoolean(6);

				Result r = new Result(id, tester_email, client_email, date_processed, date_tested, result);
				myList.add(r);
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			
			System.out.println(myList.size());
			request.setAttribute("Results", myList);
			RequestDispatcher rd = request.getRequestDispatcher("clientUserPage.jsp");
			rd.forward(request, response);

		} catch(Exception e) {
			System.out.println("SQLException caught: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
