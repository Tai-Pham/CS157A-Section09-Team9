<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
<h1> <span style='color:white; font-size:100px'>Covid Testing Locations</h1>
Filter By: <br>
<select id="country" name="country">
      <option value="City">City</option>
      <option value="State">State</option>
    </select>
<input type="text" id="fname" name="fname" placeholder="Type Here" style="width:500px">
<input type="submit" value="Search">

<body style="background-color:gray;"></body>


<hr style="height:2px;border-width:0;color:black;background-color:black">
<div class="Post">
Santa Clara Valley Medical Center (SCVMC) - Valley Health Center Downtown <br>
777 E Santa Clara Street, San Jose, CA 95112 <br>
7 days a week, 8:30am – 5:00pm <br>
People who test at one of these sites should receive their results within 3-7 days. If you have not received your results in this timeframe call Valley Connection Line at 1-888-334-1000
</div>
<hr style="height:2px;border-width:0;color:black;background-color:black">
</html>