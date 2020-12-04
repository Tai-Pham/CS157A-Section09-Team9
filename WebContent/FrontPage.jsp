<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style type="text/css">
	h1 {
		text-align: center;
		color: white;
	}
	.post {
		text-align:center;
		font-size:30px;
		border-style: solid;
		color: white;
		padding: 0px;
	}
	.post:hover {
	
		border-color: coral;
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
		color: white;
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
			  
			<c:choose>
				<c:when test="${sessionScope.username != null}">
   	 				<li><a href="${sessionScope.type}PageServlet">${sessionScope.username}</a></li>
   	 				<li><a href="logoutServlet">Logout</a></li>
				</c:when>
			
				<c:otherwise>
					<li><a href="loginPage.jsp">Login</a></li>
				</c:otherwise>
			</c:choose>
			
			</ul>
		  </nav>
		</div>
	  </header>
    
	<body style="background-image: url('test.jpg');">
		<h1> <span style='color:white; font-size:100px'>Covid Testing Locations </span> </h1>
		<img src="Banner.JPG" style="width:90%;" class="center">
		<form action="Search" method="get">	
			&nbsp;&nbsp;<div style="color:white">Filter By: </div>&nbsp;
			
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
		<c:choose>
			<c:when test = "${empty locations}">
           		<h1> NO CITY WITH THE GIVEN NAME</h1>
         	</c:when>
			<c:otherwise>
				<c:forEach items="${locations}" var="l">
					<div class="post">
						${l.name} <br>
						${l.address}<br>
						Phone: ${l.phone} <br>
						Open Hours: ${l.open_hour}<br>
						Turnaround time: around ${l.turnaround_time} days.<br>
						<br>
						Additional Information
						<pre style="color: white;"> ${l.info} </pre>
					</div>
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</body>
</html>
