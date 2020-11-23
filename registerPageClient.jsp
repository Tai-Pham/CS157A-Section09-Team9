<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
body 
{
    text-align: center;
}
font
{
    margin-bottom:25px;
}
.title
{
    font-size:35px;
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
            <span style='color:white;font-size:100px'>
            <div class='title'>First Name</div>
            <input type='text' name='firstname' style="height:50px; width:300px; font-size:25px; margin-bottom: 15px;">
            <div class='title'>Last Name</div>
            <input type='text' name='lastname' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Age</div>
            <input type ='number' name = 'age' min = '1' max = '105' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Username</div>
            <input type='text' name='username' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Password</div>
            <input type = 'password' name = 'password' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Repeated Password</div>
            <input type = 'password' name = 'repeatedpassword' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Email</div>
            <input type = 'text' name = 'email' style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <pre>
<input type = 'submit' value = 'Register' name = 'registerButton' style="height:70px; width:150px; font-size:25px;margin-bottom: 15px;">
<input type = 'submit' value = "Back" name = "backButton" style="height:70px; width:150px; font-size:25px;">
            </pre>
        </form>
    </body>
</html>

<%  String login = request.getParameter("registerButton");
    if("Register".equals(login))
    {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        int age = Integer.parseInt(request.getParameter("age"));
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String repeatedPass = request.getParameter("repeatedpassword");
        String email = request.getParameter("email");
        firstName = firstName.replaceAll("\\s","");
        lastName = lastName.replaceAll("\\s","");

        if (firstName.isEmpty() || lastName.isEmpty() || username.isEmpty() || pass.isEmpty() || repeatedPass.isEmpty() || email.isEmpty())
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
                String dbUsername = "";
                String dbEmail = "";
                int accountID = 0;

                try {
                    java.sql.Connection con; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db,user, password);

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT Username FROM 157a_project.`account` WHERE Username LIKE '"+username+"'");

                    while (rs.next()) {
                        dbUsername = rs.getString(1);
                    }

                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT Email FROM 157a_project.`account` WHERE Email LIKE '"+email+"'");

                    while (rs.next()) {
                        dbEmail = rs.getString(1);
                    }

                    if (dbUsername.equals(username))
                    {
                        out.println("Username is taken.");
                    }
                    else if (dbEmail.equals(email))
                    {
                        out.println("Email is taken.");
                    }
                    else
                    {
                        stmt = con.createStatement();
                        int i = stmt.executeUpdate("INSERT INTO 157a_project.`account`(Email, Username, Password) values('"+email+"', '"+username+"', '"+pass+"')");
                        String testerName = firstName + " " + lastName;
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT `Account ID` FROM 157a_project.`account` WHERE Email Like '"+email+"'");
                        
                        while (rs.next()) {
                            accountID = rs.getInt(1);
                        }

                        stmt = con.createStatement();
                        i = stmt.executeUpdate("INSERT INTO 157a_project.`client`(`Account ID`, `Age`) values('"+accountID+"', '"+age+"')");

                        response.sendRedirect("http://localhost:8080/loginPage.jsp");
                    }
                    
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