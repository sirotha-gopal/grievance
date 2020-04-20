<%-- 
    Document   : facultyIssueViewPage
    Created on : Mar 11, 2019, 12:55:21 AM
    Author     : admi-n
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    String msg=rss.getString(10);
    String stuRollNo=rss.getString(2);
    String stuName=rss.getString(3);
    String studentEmail=rss.getString(6);
    
    String iid="I"+newIid;
            

%>

<!DOCTYPE html>
<html>
    
    
<head>
    <title>HPR Reply Page</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	
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
    <form action="mail.jsp" method="post">
		<div class="row">
                    <label>Name:</label><br>
			<div class="col">
                            <input type="text" name="stuName" class="form-control" readonly="readonly" placeholder="Name" style="background-color: white;" value="<%=stuName%>">
			</div>
                    
                    <label>Roll No</label>
			<div class="col">
                            <input type="text" name="stuRoll" class="form-control" readonly="readonly" placeholder="ID" style="background-color: white;" value="<%=stuRollNo%>">
			</div>
		</div><br>

                <label>Issue Id</label><br>
                <div class="row">
                    
			<div class="col">
                            <input type="text" name="issueId" class="form-control" readonly="readonly" placeholder="Name" style="background-color: white;" value="<%=iid%>">
			</div>
                </div><br>
                
                <label>Subject</label>
                <div class="row">
                    
			<div class="col">
                            <input type="text" name="subject" class="form-control"  placeholder="subject" style="background-color: white;" >
			</div>
		</div><br>
                
                    <label>Student Email</label><br>
                <div class="row">
                    <div class="col">
                        <input type="text" name="stuEmail" class="form-control" readonly="readonly"  style="background-color: white;" value="<%=studentEmail%>">
			</div>
		
		</div><br>
                
                <label>Reply</label><br>
                <div class="row">
                    <div class="col">
                            <textarea name="replyMsg" placeholder="Reply..."  rows="15" cols="30" class="form-control" style="background: white;"></textarea>
			</div>
		
		</div><br>
                
                <div class="row">
                    <div class="col">
                        <input type="checkbox" name="status" value="underprocess">&nbsp;make this issue under process!
                    </div>
		
		</div><br>
                
                <div class="row">
                    <div class="col">
                    
        	<button type="submit" class="button">Send</button>
                
                        </div>
		</div><br>
                
                

	</form>
</div>

</body>
</html>

