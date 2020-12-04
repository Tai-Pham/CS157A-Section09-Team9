<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//All ready login
	if (session.getAttribute("username") != null) {
		response.sendRedirect("home");
	}



%>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
body 
{
    text-align: center;
    margin-bottom:50px;
    background-color:gray;
}
input
{
    margin-bottom:50px;
}
font
{
    margin-bottom:50px;
}
.title
{
    font-size:35px;
}
a {font-size: 30px;}

</style>
<html>
    <head>
        <title> Covid Testing Locations </title>
    </head>
    <body>
        <h1> <span style='color:white; font-size:100px'>Covid Testing Locations</span></h1>
        
        <h2> <span style='color:white; font-size:100px'>Tester Registration</span></h2>
        
        <form action='TesterRegServlet'  method='post'>
            <span style='color:white;font-size:100px'>
            <div class='title'>First Name</div>
            <input type='text' name='firstname' required="required" style="height:50px; width:300px; font-size:25px; margin-bottom: 15px;">
            <div class='title'>Last Name</div>
            <input type='text' name='lastname' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Username</div>
            <input type='text' name='username' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Password</div>
            <input type = 'password' name = 'password' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Repeated Password</div>
            <input type = 'password' name = 'repeatedpassword' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <div class='title'>Email</div>
            <input type = 'text' name = 'email' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
            <pre>
<input type = 'submit' value = 'Register' name = 'registerButton' style="height:70px; width:150px; font-size:25px;margin-bottom: 15px;">
            </pre>
        </form>
        
        <a href="loginPage.jsp">Return to Login Page</a><br>
        <a href="home">Return to Home Page</a><br>
        
    </body>
</html>

