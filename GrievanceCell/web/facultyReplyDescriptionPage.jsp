<%-- 
    Document   : facultyIssueViewPage
    Created on : Apr 2, 2019, 10:41:27 AM
    Author     : admi-n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>

<%
    
    
    String facultyId=(String)session.getAttribute("facultyId");
    String design=(String)session.getAttribute("designation");
    String firstName=(String)session.getAttribute("facultyFirstName");
    String lastName=(String)session.getAttribute("facultyLastName");
    String branch=(String)session.getAttribute("branch");
    String fullName=firstName.concat(" ").concat(lastName);
    fullName=fullName.toUpperCase();
    
    String issueId=request.getParameter("issueId");
    int newIid=Integer.valueOf(issueId.substring(1));
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement stt=conn.prepareStatement("select * from stu_replay where iid=?");
    stt.setInt(1, newIid);
    ResultSet rss=stt.executeQuery();
    rss.next();
    String reply=rss.getString(5);
    String iid="I"+newIid;

%>
<!DOCTYPE html>
<html>
<head>
        
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>Faculty Reply Description Page</title>
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
<!--Navigation-->
<nav class="navbar navbar-expand-sm sticky-top navbar-light bg-light" style="padding: 0px; margin: 0px;">
	<a class="navbar-brand" href="#"><img src="img/gtoup.png" class="img-responsive img-thumbnail" style="width: 200px;"></a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	
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

<!--User Name and ID-->
<div class="container">
    <form action="facultyIssueReply.jsp" method="post">
		<div class="row">
                    <lable>Name</lable><br>
			<div class="col">
                            <input type="text" name="studentName" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=firstName.concat(lastName)%>">
			</div>
                    <lable>Issue Id</lable><br>
			<div class="col">
                            <input type="text" name="issueId" class="form-control" readonly="readonly" placeholder="ID" style="background-color: white;" value="<%=iid%>">
			</div>
		</div><br>
                <lable>Faculty Id</lable><br>
                <div class="row">
                    
			<div class="col">
                            <input type="text" name="studentRollNo" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=facultyId%>">
			</div>
                    
		</div><br><br>
                <lable>Reply</lable><br>
                <div class="row">
                  
			<div class="col">
                            <textarea name="issue" readonly="readonly" rows="15" cols="30" class="form-control" style="background: white;"><%=reply%></textarea>
			</div>
                    
		</div><br>
                	</form>

       </div><br>
               
	

<!-- Reply Button-->

</body>
</html>