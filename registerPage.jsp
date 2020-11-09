<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
body 
{
    text-align: center;
}
select
{
    width: 200px;
    text-align: center;
    font-size:50px
}
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
Repeated Password
<input type = 'password' name = 'repeatedpassword' style="height:50px; width:300px; font-size:25px;">
Email
<input type = 'text' name = 'email' style="height:50px; width:300px; font-size:25px;">
Type
<select id="option" name="AccountOptions">
    <option value="Admin">Admin</option>
    <option value="Client">Client</option>
    <option value="Tester">Tester</option>
</select>

<input type = 'submit' value = 'Register' name = 'registerButton' style="height:70px; width:150px; font-size:25px;">

<input type = 'submit' value = "Back" name = "backButton" style="height:70px; width:150px; font-size:25px;">
</pre>
</form>
    </body>
</html>

<%  String login = request.getParameter("registerButton");
    if("Register".equals(login))
    {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String repeatedPass = request.getParameter("repeatedpassword");
        String email = request.getParameter("email");
        String accountType = request.getParameter("AccountOptions");

        if (username.isEmpty() || pass.isEmpty() || repeatedPass.isEmpty() || email.isEmpty())
        {
            out.println("One of the fields are empty.");
        }
        else
        {
            if (!pass.equals(repeatedPass))
            {
                out.println("Either the password or the repeated password does not match.");
            }
            else
            {
                String db = "157a_project";
                String user; // assumes database name is the same as username
                user = "root";
                String password = "liangjiachang";

                try {
                    java.sql.Connection con; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);
                                
                    Statement stmt = con.createStatement();
                    
                } catch(SQLException e) {
                    out.println("SQLException caught: " + e.getMessage());
                }
            }
        }
    }
%>


<%
    String back = request.getParameter("backButton");
    if("Back".equals(back))
    {
        response.sendRedirect("http://localhost:8080/loginPage.jsp");
    }
%>