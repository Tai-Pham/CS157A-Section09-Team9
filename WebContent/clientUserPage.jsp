<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	//user is not login so kick thm to login page
	if (session.getAttribute("username") == null) {
		response.sendRedirect("loginPage.jsp");
	}
	else if(session.getAttribute("type") != "clientPageServlet"){
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
		border-style: solid;
	}
	.post:hover {
	
		background-color: white;
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
	.result {
		text-align:center;
		font-size:30px;
		border-style: solid;
		font-family: 'Work Sans', sans-serif;
	}
	.title
    {
        font-size:35px;
        text-align: center;
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

	<head>
		<title>Covid Testing Locations</title>
	</head>

	<header>
		<div class="container">
		  <nav>
			<ul>
			  <li><a href="home">Home</a></li>
			  <li><a href="logoutServlet">Logout</a></li>
			</ul>
		  </nav>
		</div>
	  </header>
    
	<body style="background-color:gray;">
		<h1> <span style='color:white; font-size:100px'>Your Test Result</span> </h1>
	
		
    
    
    	<div class='title'>List of Results</div>
		<hr>
		
		
		<c:choose>
    	
    		<c:when test = "${not empty nothing}">
           		<h1>${nothing}</h1>
         	</c:when>
    
    	
    		<c:otherwise>
		    	<table>
		                <tr>
		                  <th>Testing Location</th>
		                  <th>Tester Email</th>
		                  <th>Date Tested</th>
		                  <th>Date Processed</th>
		                  <th>Result</th>
		                </tr>  	
		            	<c:forEach items="${results}" var="r">
		            		<tr>
								<td>${r.name}</td>
								<td>${r.email}</td>
								<td>${r.start}</td>
								<td>${r.end}</td>
								<td>${r.result}</td>
							</tr>
		            	</c:forEach>
		     	</table>
   			</c:otherwise>
   			
   		</c:choose>
    
		
	</body>
</html>