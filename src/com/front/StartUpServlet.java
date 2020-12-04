package com.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/home")
public class StartUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public StartUpServlet() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    	String user = "root";
		String password = "liangjiachang";
		
		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/157a_project?autoReconnect=true&useSSL=false", user, password);
			Statement stmt = con.createStatement();		
			String statement = String.format("SELECT Address, Name, `Open Hours`, `Turnaround Time`, Phone, Body FROM address JOIN `testing location` USING(`Location ID`) JOIN `at` USING(`Location ID`) JOIN post USING(`Post ID`)");
			ResultSet rs = stmt.executeQuery(statement);
			
			ArrayList<LocationInfo> locationInfo = new ArrayList<>();
			while (rs.next()) {
				String address = rs.getString(1);
				String name =  rs.getString(2);
				String open = rs.getString(3);
				int turnaround = rs.getInt(4);
				String phone = rs.getString(5);
				String info = rs.getString(6);
				LocationInfo loc = new LocationInfo(address, name, open, turnaround, phone, info);
				locationInfo.add(loc);
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			request.setAttribute("locations", locationInfo);
			RequestDispatcher rd = request.getRequestDispatcher("FrontPage.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			System.out.println("Exception caught: " + e.getMessage());
		}
    	
    }

    //throws ServletException, IOException
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		String user = "root";
		String password = "liangjiachang";
		
		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/157a_project?autoReconnect=true&useSSL=false", user, password);
			Statement stmt = con.createStatement();		
			String statement = String.format("SELECT Address, Name, `Open Hours`, `Turnaround Time`, Phone, Body FROM address JOIN `testing location` USING(`Location ID`) JOIN `at` USING(`Location ID`) JOIN post USING(`Post ID`)");
			ResultSet rs = stmt.executeQuery(statement);
			
			ArrayList<LocationInfo> locationInfo = new ArrayList<>();
			while (rs.next()) {
				String address = rs.getString(1);
				String name =  rs.getString(2);
				String open = rs.getString(3);
				int turnaround = rs.getInt(4);
				String phone = rs.getString(5);
				String info = rs.getString(6);
				LocationInfo loc = new LocationInfo(address, name, open, turnaround, phone, info);
				locationInfo.add(loc);
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			
			
			request.setAttribute("locations", locationInfo);
			RequestDispatcher rd = request.getRequestDispatcher("FrontPage.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			System.out.println("Exception caught: " + e.getMessage());
		}
	}
}
