package com.front;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		
		String user = "root";
		String password = "BasedData420";
		
		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);
			Statement stmt = con.createStatement();
			
			int stateId = 0;
			int cityId = -1;			
			String statement = String.format("SELECT `State Id` FROM cs157a_project.state WHERE Name = '%s'", req.getParameter("state"));
			ResultSet rs = stmt.executeQuery(statement);
			
			
			while (rs.next()) {
				stateId = rs.getInt(1);
			}
			
			
			if(req.getParameter("fname").length() > 0) {
				statement = String.format("SELECT `City Id` FROM cs157a_project.city WHERE Name = '%s'", req.getParameter("fname"));
				rs = stmt.executeQuery(statement);
				while (rs.next()) {
					cityId = rs.getInt(1);
				}
				//add an error page here if cityId is tell -1
			}
			
			//if cityId is -1 that mean it wasn't set
			//the code above will return a error page in the future stating that it couldn't find the city if the query return empty
			if(cityId > -1) {	
				statement = String.format("SELECT ad.Address, t.* FROM (SELECT * FROM cs157a_project.address WHERE `State ID` = '%s' and `City ID` = '%s') AS ad, cs157a_project.`testing location` AS t WHERE ad.`Address ID` = t.`Address ID`", Integer.toString(stateId), Integer.toString(cityId));	
			} else {
				statement = String.format("SELECT ad.Address, t.* FROM (SELECT * FROM cs157a_project.address WHERE `State ID` = '%s') AS ad, cs157a_project.`testing location` AS t WHERE ad.`Address ID` = t.`Address ID`", Integer.toString(stateId));	
			}
			
			
			ArrayList<LocationInfo> locationInfo = new ArrayList<>();
			rs = stmt.executeQuery(statement);
			while (rs.next()) {
				String address = rs.getString(1);
				String name =  rs.getString(4);
				String open = rs.getString(7);
				int turnaround = rs.getInt(8);
				String phone = rs.getString(9);
				LocationInfo loc = new LocationInfo(address, name, open, turnaround, phone);
				locationInfo.add(loc);
			
			}
			
			rs.close();
			stmt.close();
			con.close();
			
			req.setAttribute("locations", locationInfo);
			RequestDispatcher rd = req.getRequestDispatcher("FrontPage.jsp");
			rd.forward(req, res);
			
		} catch(Exception e) {
			//Need to replace this with an error page
			System.out.println("Exception caught: " + e.getMessage());
		}
		
	}
}