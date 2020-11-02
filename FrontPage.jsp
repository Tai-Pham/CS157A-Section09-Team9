<%@ page import="java.sql.*"%>
<html>
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
	</style>
  <head>
    <title>Covid Testing Locations</title>
    </head>
  <body>
    <h1>Covid Testing Locations</h1>    
	<%     
     	String db = "cs157a";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "password";
        
        String[] address = null;
        
        try {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&useSSL=false", user, password);
        	        	
        	Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM cs157a.`address`");
            
        	int size = 0;
        	if (rs.next()) {
                size = rs.getInt(1);
            }        	
            address = new String[size + 1];
            
            rs = stmt.executeQuery("SELECT * FROM cs157a.`address`");
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM cs157a.`testing location`");
			
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
	%>
  </body>
</html>
