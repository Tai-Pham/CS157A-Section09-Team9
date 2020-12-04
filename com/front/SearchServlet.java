package com.front;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchServlet", urlPatterns = "/Search")
public class SearchServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		
		String user = "root";
		String password = "liangjiachang";
		
		try {
			java.sql.Connection con; 
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/157a_project?autoReconnect=true&useSSL=false", user, password);
			Statement stmt = con.createStatement();
			
			int stateId = 0;
			int cityId = -1;			
			String statement = String.format("SELECT `State Id` FROM 157a_project.state WHERE Name = '%s'", req.getParameter("state"));
			ResultSet rs = stmt.executeQuery(statement);	
			while (rs.next()) {
				stateId = rs.getInt(1);
			}
			
			
			if(req.getParameter("fname").length() > 0) {
				statement = String.format("SELECT `City Id` FROM 157a_project.city WHERE Name = '%s'", req.getParameter("fname"));
				rs = stmt.executeQuery(statement);
				while (rs.next()) {
					cityId = rs.getInt(1);
				}
				
				if(cityId == -1)
				{
					RequestDispatcher rd = req.getRequestDispatcher("FrontPage.jsp");
					rd.forward(req, res);
					return;
				}
				
			}
			
			//if cityId is -1 that mean it wasn't set
			//the code above will return a error page in the future stating that it couldn't find the city if the query return empty
			if(cityId > -1) {	
				statement = String.format("SELECT Address, `name`, `Open Hours`, `Turnaround Time`, Phone, Body FROM (SELECT * FROM 157a_project.address WHERE `State ID` = '%s' and `City ID` = '%s') AS ad JOIN 157a_project.`testing location` USING(`location ID`) JOIN 157a_project.`at` USING(`Location ID`) JOIN 157a_project.`post` USING(`Post ID`)", Integer.toString(stateId), Integer.toString(cityId));	
			} else {
				statement = String.format("SELECT Address, `name`, `Open Hours`, `Turnaround Time`, Phone, Body FROM (SELECT * FROM 157a_project.address WHERE `State ID` = '%s') AS ad JOIN 157a_project.`testing location` USING(`location ID`) JOIN 157a_project.`at` USING(`location ID`) JOIN 157a_project.`post` USING(`Post ID`)", Integer.toString(stateId));	
			}
			
			
			ArrayList<LocationInfo> locationInfo = new ArrayList<>();
			rs = stmt.executeQuery(statement);
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
			
			req.setAttribute("locations", locationInfo);
			RequestDispatcher rd = req.getRequestDispatcher("FrontPage.jsp");
			rd.forward(req, res);
			
		} catch(Exception e) {
			//Need to replace this with an error page
			System.out.println("Exception caught: " + e.getMessage());
		}
		
	}
}