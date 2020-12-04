<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	input{margin-bottom:50px;}
	h1 {text-align: center;}
	body {text-align: center; background-color:gray;}
	a {font-size: 30px;}
	
</style>

<html>
    <head>
   		<title> Covid Testing Locations </title>
    </head>
    <body>
        <h1> <span style='color:white; font-size:100px'>Covid Testing Locations</span></h1>

		<c:if test="${not empty error}">
    		<h2> ${error} </h2>
		</c:if>
		
		<c:if test="${not empty success}">
    		<h2> ${success} </h2>
		</c:if>
	
		<form action="loginServlet"  method='post'>
	
			<span style='color:white;font-size:100px'>Username</span><br>
			<input type='text' name='username' required="required" pattern="[A-Za-z0-9]{1,20}" style="height:50px; width:300px; font-size:25px;"><br>
			<span style='color:white;font-size:100px'>Password</span><br>
			<input type = 'password' name = 'password' required="required" pattern="[A-Za-z0-9]{1,20}" style="height:50px; width:300px; font-size:25px;"><br>
	
			<select id="accountType" name="accountType" style="font-size: 45;">
			    <option value="Client">Client</option>
			    <option value="Tester">Tester</option>
			    <option value="Admin">Admin</option>
			</select>


			<br> 
			<br>

			<input type = 'submit' value = "Login" name = "loginButton" style="height:70px; width:150px; font-size:25px;">
		</form>
		
		<a href="registerPageClient.jsp">Register as Client</a><br>
		<a href="registerPageTester.jsp">Register as Tester</a><br>
		
    </body>
    
</html>