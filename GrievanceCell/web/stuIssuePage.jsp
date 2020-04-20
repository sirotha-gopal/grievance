<%-- 
    Document   : stuIssue
    Created on : Feb 27, 2019, 12:53:10 AM
    Author     : admi-n
--%>
<%          
            
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
    
            if(session.getAttribute("rollNo")==null)
            {
                response.sendRedirect("index.jsp");
            }
            
            
            
            String issueMsg=(String)session.getAttribute("successMsg");
            if(issueMsg==null)
            {
              issueMsg="  ";
            }
            //String rollNo=(String)session.getAttribute("rollNo");
            String name=(String)session.getAttribute("studentFirstName");
            String capsName=name.concat(" !").toUpperCase();
            Date date=new Date();
            Date time=new Date();
            SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yy");
            SimpleDateFormat sdf1= new SimpleDateFormat("HH:mm:ss aa");
            String sd=sdf.format(date);
            String tt=sdf1.format(time);
        %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>Student Issue Page</title>
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
	<div class="collapse navbar-collapse" id="myMenu">
		<ul class="navbar-nav ml-auto"> 
			<li class="nav-item"><a href="stuIssuePage.jsp" class="nav-link active">Register Issue</a></li>
                        <li class="nav-item"><a href="studentPreviousIssuePage.jsp" class="nav-link">View Previous Grievance</a></li>
                        <li class="nav-item"><a href="studentReplyViewPage.jsp" class="nav-link">View Reply</a></li>
                        <li class="nav-item"><a href="personalinfoStudent.jsp" class="nav-link">Personal Info</a></li>
                        <a href="Logout.jsp"><button class="btn btn-danger" data-target="#signupModal" data-toggle="modal"><span class="glyphicon glyphicon-log-out"></span>Log out</button></a>
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
					<h1>Student Issue Form</h1>
                                        <form action="stuIssuepro.jsp" method="post">
						        			<br>
                                                                                <p><%=issueMsg%></p>
						        			<div class="form-group">
						        				<label>Roll No:</label>
						        				<input type="text" name="rollNo" readonly="readonly" class="form-control disabled" value="${rollNo}">
                                                                                        <input type="hidden" name="status" value="open">
						        			</div>
						        			<div class="form-group">
						        				<label>Your Name:</label>
						        				<input type="text" name="stuname" readonly="readonly" class="form-control disabled" value="<%=name%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Date:</label>
						        				<input type="text" name="date" readonly="readonly" class="form-control disabled" value="<%=sd%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Time:</label>
						        				<input type="text" readonly="readonly" class="form-control disabled" value="<%= tt%>">
						        			</div>
						        			<div class="form-group">
						        				<label>Email Id:</label>
						        				<input type="email" placeholder="Email ID" name="email" class="form-control">
						        			</div>
						        			<div class="form-group">
						        				<label for="exampleFormControlSelect1">Category:</label>
						        				<select name="cat" class="form-control" id="exampleFormControlSelect1">
						        					<option>Subject</option>
								                    <option>Faculty</option>
								                    <option>Registrar</option>
								                    <option>HOD</option>
								                    <option>Library</option>
								                    <option>Accounts</option>
								                    <option>Sports</option>
								                    <option>Hostel</option>
								                    <option>Bus</option>
								                    <option>Management</option>
						        				</select>
						        			</div>
						        			<div class="form-group">
						        				<label for="exampleFormControlSelect1">Branch:</label>
						        				<select name="branch" class="form-control" id="exampleFormControlSelect1">
						        			    <option>CSE</option>
								                    <option>ME</option>
								                    <option>EX</option>
								                    <option>EC</option>
								                    <option>Civil</option>
								                    <option>IT</option>
						        				</select>
						        			</div>
						        			<div class="form-group">
						        				<label>Issue:</label>
						        				<input type="text" name="subject" placeholder="Subject" class="form-control">
						        			</div>
						        			<div class="form-group">
						        				<label>Description:</label>
						        				<textarea name="issue" placeholder="Write your issue..." rows="10" cols="20" class="form-control"></textarea>
						        			</div>
                                                                                <p style="font-size: 10px; color: red; " id="parentValidationMsg"></p><br>
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
              <jsp:include page="footer.jsp"/>                                                                      
</div>

                                                                                       
                                                                                        
                                                                                        
                                                                                        
                                                                                

</body>
</html>