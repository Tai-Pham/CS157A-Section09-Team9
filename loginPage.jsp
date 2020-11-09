<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
body {text-align: center;}
</style>
<html>
    <head>
    <title> Covid Testing Locations </title>
    </head>

    <body>
        <h1> <span style='color:white; font-size:100px'>Covid Testing Locations</h1>

    <body style="background-color:gray;">
<form  method='post'>
<pre>
<span style='color:white;font-size:100px'>     
Username
<input type='text' name='username' style="height:50px; width:300px; font-size:25px;">
Password
<input type = 'password' name = 'password' style="height:50px; width:300px; font-size:25px;">

<input type = 'submit' value = "Login" name = "loginButton" style="height:70px; width:150px; font-size:25px;">

<input type = 'submit' value = 'Register' name = 'registerButton' style="height:70px; width:150px; font-size:25px;">
</pre>
</form>
    </body>
</html>
<%  String login = request.getParameter("loginButton");
    if("Login".equals(login))
    {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");

        if (username.isEmpty() || pass.isEmpty())
        {
            out.println("Username or password is empty.<br>");
        }
        else
        {
            String db = "157a_project";
            String user; // assumes database name is the same as username
            user = "root";
            String password = "liangjiachang";

            boolean exists = false;
            String dbUsername = "";
            String dbPassword = "";

            try {
                java.sql.Connection con; 
                Class.forName("com.mysql.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
                            
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT Username, Password FROM 157a_project.`account` WHERE Username LIKE '%" + username + "%'");

                while (rs.next()) {
                    dbUsername = rs.getString(1);
                    dbPassword = rs.getString(2);
                }

                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
            
            if (dbUsername.isEmpty() && dbPassword.isEmpty())
            {
                out.println("Username or password is incorrect<br>");
            }
            else
            {
                if (dbUsername.equals(username) && dbPassword.equals(pass))
                {
                    response.sendRedirect("http://localhost:8080/FrontPage.jsp");
                }
            }
        }
    }
%>

<%
    String register = request.getParameter("registerButton");
    if("Register".equals(register))
    {
        response.sendRedirect("http://localhost:8080/registerPage.jsp");
    }
%>