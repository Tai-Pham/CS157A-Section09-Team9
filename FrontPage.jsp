<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.front.LocationInfo"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style type="text/css">
	h1 {
		text-align: center;
	}
	.post {
		text-align:center;
		font-size:30px;
	}
	input[type=text] {
		box-sizing: border-box;
	}
	input[type=submit] {
		box-sizing: border-box;
		cursor: pointer;
	}

	url('https://fonts.googleapis.com/css?family=Work+Sans:400,600');
	body {
		margin: 100;
		background: #222;
		font-family: 'Work Sans', sans-serif;
		font-weight: 800;
	}
	.container {
		max-width: 100%;
		height: 60px;
		margin: 0 auto;
	}
	header {
		background: #3A383D;
	}
	header::after {
		content: '';
		display: table;
		clear: both;
	}
	nav {
		clear: both;
		float: right;
	}
	nav ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	nav li {
		display: inline-block;
		margin-left: 70px;
		padding-top: 23px;
		position: relative;
	}
	nav a {
		color: white;
		text-decoration: none;
		text-transform: uppercase;
		font-size: 14px;
	}
	nav a:hover {
		color: black;
	}
	nav a::before {
		content: '';
		display: block;
		height: 5px;
		background-color: white;
		position: absolute;
		top: 0;
		width: 0%;
		transition: all ease-in-out 250ms;
	}
	nav a:hover::before {
		width: 100%;
	}
	.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	}
</style>
<html>

	<head>
		<title>Covid Testing Locations</title>
	</head>

	<header>
		<div class="container">
		  <nav>
			<ul>
			  <li><a href="#">Home</a></li>
			  <li><a href="#">Results</a></li>
			  <li><a href="#">Log Out</a></li>
			</ul>
		  </nav>
		</div>
	  </header>
    
	<body style="background-color:gray;">
		<h1> <span style='color:white; font-size:100px'>Covid Testing Locations </span> </h1>
	
		<form action="search" method="get">	
			&nbsp;&nbsp;Filter By: <br> &nbsp;
			
			<select id="state" name="state">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>	
				<option value="DE">Delaware</option>
				
				<option value="DC">District of Columbia</option>
				
				<option value="FL">Florida</option>
				
				<option value="GA">Georgia</option>	
				
				<option value="HI">Hawaii</option>
				
				
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				
				<option value="LA">Louisiana</option>
				
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
							
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				
				<option value="PA">Pennsylvania</option>
				
				<option value="RI">Rhode Island</option>
				
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				
				<option value="UT">Utah</option>
				
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
				
				<option value="WY">Puerto Rico</option>
				
				
			</select>
			
			<input type="text" id="fname" name="fname" placeholder="City (optional)" style="width:500px">
			<input type="submit">	
		</form>

		
		<%  
			//there was a query by the user
			if(null != request.getAttribute("locations")) {
				ArrayList<LocationInfo> locations = (ArrayList<LocationInfo>)request.getAttribute("locations");			
				for(LocationInfo location : locations) {
					%>
						<hr style="height:2px;border-width:0;color:black;background-color:black">
						<div class="Post">
							<%=location.getName()%><br>
							<%=location.getAddress()%><br>
							7 days a week, <%=location.getOpen_hour()%><br>
							People who test at this site should receive their results within <%=location.getTurnaround_time()%> days.
							If you have not received your results in this timeframe, call <%=location.getName()%> Line at <%=location.getPhone()%>
						</div>
					<% 					
				}
		    }
			else {
				String db = "cs157a_project";
				String user; // assumes database name is the same as username
				user = "root";
				String password = "";
	        
				String[] address = null;			
				try {
					java.sql.Connection con; 
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);
					
					Statement stmt = con.createStatement();
					ResultSet rs = null;
	
					rs = stmt.executeQuery("SELECT COUNT(*) FROM cs157a_project.address");
					int size = 0;
					if (rs.next()) {
						size = rs.getInt(1);
					}
					
					address = new String[size + 1];
		            
					rs = stmt.executeQuery("SELECT * FROM cs157a_project.address");
					while (rs.next()) {
						address[rs.getInt(1)] = rs.getString(4);
					}
					rs.close();
					stmt.close();
					con.close();
				} catch(SQLException e) {
					out.println("SQLException caught: " + e.getMessage());
				}
				
				boolean appointments, drive_through;
				int location_id, address_id, turnaround_time;
				String name, open_hours, phone, url;
				
				
				try {
					java.sql.Connection con; 
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);
		            
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM cs157a_project.`testing location`");
					
					while (rs.next()) {
						location_id = rs.getInt(1);
						address_id = rs.getInt(2);
						name = rs.getString(3);
						appointments = rs.getBoolean(4);
						drive_through = rs.getBoolean(5);
						open_hours = rs.getString(6);
						turnaround_time = rs.getInt(7);
						phone = rs.getString(8);
						url = rs.getString(9);
			%>
			
			<hr style="height:2px;border-width:0;color:black;background-color:black">
			<div class="Post">
				<%=name%><br>
				<%=address[address_id]%><br>
				7 days a week, <%=open_hours%><br>
				People who test at this site should receive their results within <%=turnaround_time%> days.
				If you have not received your results in this timeframe, call <%=name%> Line at <%=phone%>
			</div>
			
			<%    
				}
				rs.close();
				stmt.close();
				con.close();
			} catch(SQLException e) { 
				out.println("SQLException caught: " + e.getMessage()); 
			}

		}
		%>
	

	</body>
</html>
