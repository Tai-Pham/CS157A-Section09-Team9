<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//user is not login so kick thm to login page
	if (session.getAttribute("username") == null) {
		response.sendRedirect("loginPage.jsp");
	}
	else if(session.getAttribute("type") != "LocationRegServlet"){
		response.sendRedirect("home");
	}
%>

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
	url(https://fonts.googleapis.com/css?family=Work+Sans:400,600);
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
    .title
    {
        font-size:35px;
        text-align: center;
    }
    hr 
    { 
        width:"100%"; 
        color:"black";
        height: 5px; 
        background: black; 
    }
    table, th, td 
    {
        padding: 10px;
        font-size: 25px;
        text-align: center;
    }
    table 
    {
        margin-left: auto; 
        margin-right: auto;
    } 
</style>
<html>
	<header>
		<div class="container">
		  <nav>
			<ul>
			  <li><a href="home">Home</a></li>
			  <li><a href="logoutServlet">Log Out</a></li>
			</ul>
		  </nav>
		</div>
	  </header>
	<head>
		<title>Covid Testing Locations</title>
    </head>
    
    <body style="background-color:gray; text-align: center; font-size: 30;">
        <h1> <span style='color:white; font-size:100px'>Covid Testing Locations</h1>
            <div class='title'>Clients</div>
			<hr>
			<form  action='testerPageServlet' method='post'>
				<div>Client Test Results:</div>
                <input type = 'text' name = 'clientEmail' placeholder="Client's Email" required="required" style="height:4%; width:10%; font-size:25px;margin-bottom: 15px;">
                Date Processed
                <input type = 'date' name = 'dateProcessed' placeholder="yyyy-mm-dd" required="required" style="height:4%; width:10%; font-size:25px;margin-bottom: 15px;">
                Date Tested
                <input type = 'date' name = 'dateTested' placeholder="yyyy-mm-dd" required="required" style="height:4%; width:10%; font-size:25px;margin-bottom: 15px;">
                <select id="result" name="result" style="font-size: 30px;">
                    <option value="Positive">Positive</option>
                    <option value="Negative">Negative</option>
                </select>
				<input type = 'submit' value = 'Submit' name = 'submitButton' style="height:4%; width:5%; font-size:25px;margin-bottom: 15px;">	
            </form> 
            <table>
                <tr>
                  <th>Account ID</th>
                  <th>Client Email</th>
                  <th>Age</th>
                </tr> 
            	
            	<c:forEach items="${client}" var="c">
					<tr>
						<td>${c.id}</td>
						<td>${c.email}</td>
						<td>${c.age}</td>
					</tr>
				</c:forEach>
     	
            </table>
    </body>
</html>

