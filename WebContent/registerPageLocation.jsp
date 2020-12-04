<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	//user is not login so kick thm to login page
	if (session.getAttribute("username") == null) {
		response.sendRedirect("loginPage.jsp");
	}

	//Not an admin account
	if(session.getAttribute("type") != "LocationRegServlet"){
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
select
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
        <form action='LocationRegServlet' id="usrform" method='post'>
            <span style='color:white;font-size:100px'>
                <div class='title'>Testing Location Name</div>
                <input type = 'text' name = 'testingLocation' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom:15px;">
                <div class='title'>Address</div>
                <input type='text' name='address' required="required" style="height:50px; width:300px; font-size:25px; margin-bottom: 15px;">
                <div class='title'>City</div>
                <input type='text' name='city' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>State</div>
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
                <div class='title'>Zip Code</div>
                <input type = 'text' name = 'zipcode' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>Appointments</div>
                <select id="appointments" name="appointments">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
                <div class='title'>Drive Through</div>
                <select id="drivethrough" name="drivethrough">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
                <div class='title'>Open Hours</div>
                <input type = 'text' name = 'hours' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>Turnaround Time</div>
                <input type = 'text' name = 'turnaround' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>Phone</div>
                <input type = 'text' name = 'phone' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>URL</div>
                <input type = 'text' name = 'url' required="required" style="height:50px; width:300px; font-size:25px;margin-bottom: 15px;">
                <div class='title'>Additional Information</div>
                <textarea name="paragraph_text" form="usrform" style="font-size: 25px;"cols="50" rows="10"></textarea>
                <pre>
<input type = 'submit' value = 'Register' name = 'registerButton' required="required" style="height:70px; width:150px; font-size:25px;margin-bottom: 15px;">
                </pre>
            </span>
        </form>
    </body>
</html>