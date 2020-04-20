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
    
    String issueId=request.getParameter("issueId");
    int newIid=Integer.valueOf(issueId.substring(1));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement stt=conn.prepareStatement("select * from studentissue where iid=?");
    stt.setInt(1, newIid);
    ResultSet rss=stt.executeQuery();
    rss.next();
    String description=rss.getString(10);
    String stuRollNo=rss.getString(2);
    String stuName=rss.getString(3);
    String stuEmail=rss.getString(6);
    String stuBranch=rss.getString(8);
    
    String iid="I"+newIid;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>HPR Issue View Page</title>
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
    <form action="HPRIssueReply.jsp" method="post">
		<div class="row">
                    <lable>Name</lable><br>
			<div class="col">
                            <input type="text" name="studentName" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=stuName%>">
			</div>
                    <lable>Issue Id</lable><br>
			<div class="col">
                            <input type="text" name="issueId" class="form-control" readonly="readonly" placeholder="ID" style="background-color: white;" value="<%=iid%>">
			</div>
		</div><br>
            
                <div class="row">
                    <lable>Roll No</lable><br>
			<div class="col">
                            <input type="text" name="studentRollNo" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=stuRollNo%>">
			</div>
                    <lable>Branch</lable><br>
			<div class="col">
                            <input type="text" name="studentBranch" class="form-control" readonly="readonly" style="background-color: white;" value="<%=stuBranch%>">
			</div>
		</div><br>
                
                        <lable>Student Email</lable><br>
                    <div class="row">
                        <div class="col">
                            <input type="text" name="studentEmail" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=stuEmail%>">
			</div>
                    
		</div><br>
                <br>
                <lable>Description:</lable><br>
                <div class="row">
                  
			<div class="col">
                            <textarea name="issue" readonly="readonly" rows="15" cols="30" class="form-control" style="background: white;"><%=description%></textarea>
			</div>
                    
		</div><br>
                
                
                <div class="row">
                  <div class="col">
                        <button type="submit" class="button">Reply</button>
                   </div>
                </div><br>
                <br>
               
	</form>
</div>

<!-- Reply Button-->

</body>
</html>