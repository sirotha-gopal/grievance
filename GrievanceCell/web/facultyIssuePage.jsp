<%-- 
    Document   : facultyIssuePage
    Created on : Apr 6, 2019, 11:02:13 PM
    Author     : admi-n
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%

    String facultyId=(String)session.getAttribute("facultyId");
    String design=(String)session.getAttribute("designation");
    String firstName=(String)session.getAttribute("facultyFirstName");
    String lastName=(String)session.getAttribute("facultyLastName");
    String branch=(String)session.getAttribute("branch");
    
    String capsName=firstName.concat(" !").toUpperCase();
    
    String fullName=firstName.concat(" ").concat(lastName);
    fullName=fullName.toUpperCase();
    
    Date date=new Date();
    Date time=new Date();
    SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yy");
    SimpleDateFormat sdf1= new SimpleDateFormat("HH:mm:ss aa");
    String sd=sdf.format(date);
    String tt=sdf1.format(time);
    
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>Faculty Issue Page</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/glyphicon.css">
	<link rel="stylesheet" type="text/css" href="css/panel.css">
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
		label
		{
			font-weight: bold;
		}
	</style>
</head>
<body>
    <%
        String msg=(String)session.getAttribute("fSuccessMsg");
        if(msg==null)
        {
            msg=" ";
        }
    %>
    
    
<!--Navigation-->
<nav class="navbar navbar-expand-sm sticky-top navbar-light bg-light" style="padding: 0px; margin: 0px;">
	<a class="navbar-brand" href="#"><img src="img/gtoup.png" class="img-responsive img-thumbnail" style="width: 200px;"></a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="myMenu">
		<ul class="navbar-nav ml-auto"> 
                    <li class="nav-item"><a href="facultyIssuePage.jsp" class="nav-link active">Register Issue</a></li>
			<li class="nav-item"><a href="facultyPreviousIssuePage.jsp" class="nav-link">View Previous Issue</a></li>
                        <li class="nav-item"><a href="facultytReplyViewPage.jsp" class="nav-link">View Reply</a></li>
			<li class="nav-item"><a href="#about" class="nav-link">Settings</a></li>
			
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span>
				Login
			</button>

		</ul>
	</div>
</nav>


<!--Grievance Heading-->
<div class="jumbotron" style="padding: 0px; margin: 0px;" >
	<div class="container">
		<div class="row"> 
			<div class="col-sm-12" style="padding-top: 20px; text-align: center;">
				<h1>GRIEVANCE CELL</h1>
			</div>
		</div>
	</div>
</div>
<br>

<!-- Hello User-->
<h1 style="align-content: center;font-weight: bold; padding-left: 15px;">Hello <%=capsName%></h1><br>
<!--Registrtion Jumbotron-->
<div class="bg-img">
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				
			</div>
			<div class="col-sm-8">
				<div class="jumbotron" style="padding-top: 10px; text-align: center; background-color: #008080; color: white;">
					<h1>Faculty Issue Form</h1>
                                        <form action="facultyIssuePro.jsp" method="post">
						        			<br>
						        			<div class="form-group">
                                                                                        <p><%=msg%></p>
						        				<label>Faculty Id:</label>
                                                                                        <input type="text" name="facultyId" readonly="readonly" class="form-control disabled" value="<%=facultyId%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Your Name:</label>
						        				<input type="text" name="facultyName" readonly="readonly" class="form-control disabled" value="<%=fullName%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Date:</label>
						        				<input type="text" name="date" readonly="readonly" class="form-control disabled" value="<%=sd%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Time:</label>
                                                                                        <input type="text" readonly="readonly" class="form-control disabled" value="<%=tt%>" name="time">
						        			</div>
						        			<div class="form-group">
						        				<label>Email Id:</label>
						        				<input type="email" placeholder="Email ID" name="email" class="form-control">
						        			</div>
						        			<div class="form-group">
						        				<label for="exampleFormControlSelect1">Category:</label>
						        				<select name="category" class="form-control" id="exampleFormControlSelect1">
                                                                                        <option>Category</option>
                                                                                    <option>Regarding Management</option>
								                    <option>Regarding Any Student</option>
								                    <option>Salary</option>
								                    <option>Others</option>
						        				</select>
						        			</div>
						        			<div class="form-group">
						        				<label for="exampleFormControlSelect1">Department:</label>
						        				<select name="branch" class="form-control" id="exampleFormControlSelect1">
						        					<option>CSE</option>
								                    <option>ME</option>
								                    <option>EX</option>
								                    <option>ECE</option>
								                    <option>CE</option>
								                    <option>IT</option>
						        				</select>
						        			</div>
						        			<div class="form-group">
						        				<label>Issue:</label>
						        				<input type="text" name="issue" placeholder="Subject" class="form-control">
						        			</div>
						        			<div class="form-group">
						        				<label>Description:</label>
						        				<textarea name="description" placeholder="Write your issue..." rows="10" cols="20" class="form-control"></textarea>
						        			</div>
						        			<br>
						        			<div class="form-group">
						        				<input type="submit" name="signup" value="Submit" style="width: 100%; background-color: orange;  font-size: 18px; cursor: pointer; color: white;">
						        			</div>
						        		</form>
				</div>
			</div>
			<div class="col-sm-2">
				
			</div>
		</div>
	</div>
</div>


</body>
</html>