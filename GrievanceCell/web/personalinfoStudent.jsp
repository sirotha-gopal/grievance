<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%

    String studentRollNo=(String)session.getAttribute("studentRollNo");
    //String studentSem=(String)session.getAttribute("studentSem");
    /*String firstName=(String)session.getAttribute("studentFirstName");
    String lastName=(String)session.getAttribute("studentLastName");
    String studentBranch=(String)session.getAttribute("studentBranch");
    String studentPhone=(String)session.getAttribute("studentPhone");
    String studentYear=(String)session.getAttribute("studentYear");
    String studentEmail=(String)session.getAttribute("studentEmail");
    String studentPass=(String)session.getAttribute("studentPass");*/
    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st=con.prepareStatement("select * from stusignup where rollno=?");
    st.setString(1, studentRollNo);
    ResultSet rs=st.executeQuery();
    
    rs.next();
    String firstName=rs.getString(1);
    session.setAttribute("FirstName", firstName);
    String lastName=rs.getString(2);
    session.setAttribute("LastName", lastName);
    String studentBranch=rs.getString(4);
    String studentYear=rs.getString(5);
    session.setAttribute("Year", studentYear);
    String studentSem=rs.getString(6);
    session.setAttribute("Sem", studentSem);
    String studentPhone=rs.getString(7);
    session.setAttribute("Phone", studentPhone);
    String studentEmail=rs.getString(8);
    session.setAttribute("Email", studentEmail);
    String studentPass=rs.getString(9);
    session.setAttribute("Pass", studentPass);
    int count = 0;  
          String newPass="";
        //Counts each character except space  
        for(int i = 0; i < studentPass.length(); i++) {  
            if(studentPass.charAt(i) != ' ')  
                count++;  
        }
        for(int j=0; j<count; j++)
        {
             newPass+="*";
        }
        session.setAttribute("NewPass", newPass);
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>Personal Info</title>
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
		.section:hover
		{
			background-color: gray;
		}

		.td_css
		{
			font-size:12px;
			font-weight:bold;
			color: #808080;
		}

		.table td a
		{
			text-decoration:none;
			color: inherit;
		}

		.td_bold
		{
			font-weight: bold;
			font-family: Arial, Helvetica, sans-serif;
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
                    <li class="nav-item"><a href="stuIssuePage.jsp" class="nav-link ">Register Issue</a></li>
                        <li class="nav-item"><a href="studentPreviousIssuePage.jsp" class="nav-link">View Previous Grievance</a></li>
                        <li class="nav-item"><a href="studentReplyViewPage.jsp" class="nav-link">View Reply</a></li>
                        <li class="nav-item"><a href="personalinfoStudent.jsp" class="nav-link active">Personal Info</a></li>
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

<!--Personal Info-->
<div class="container">
	<div class="row" >
		<h3 style="position:absolute; left:50%; transform: translate(-50%); text-align:center;">Personal Info</h3>
	</div><br><br>
	<div class="row">
		<h5 style="text-align: center; position:absolute; color:gray; font-weight:40px; left:50%; transform: translate(-50%);">Basic info, like your name and id, that you use on our website</h5>
	</div><br><br>	
	<div class="row">
			<div class="container">
					<div class="jumbotron border" style="background-color:white; padding-top:20px; padding-bottom:0px;">
						<h4>Profile</h4><br><br>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td class="td_css">NAME</td>
                                                                        <td class="td_bold"><%=firstName.concat(" ").concat(lastName).toUpperCase()%></td>
									<td><a href="personalinfoStudentName.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
								</tr>
								<tr>
									<td class="td_css">YEAR</td>
									<td class="td_bold"><%=studentYear%></td>
									<td><a href="personalinfoStudentYear.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
								</tr>
								
                                                                <tr>
									<td class="td_css">SEMESTER</td>
									<td class="td_bold"><%=studentSem%></td>
									<td><a href="personalinfoStudentSemester.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
								</tr>
                                                                
								
                                                                <tr>
                                                                    
                                                                        <td class="td_css">PASSWORD</td>
									<td class="td_bold"><%=newPass%><br><span class="td_css"></span></td>
									<td><a href="personalinfoStudentPassword.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
                                                                        
								</tr>
                                                                
							</tbody>
						</table>
					</div>
			</div>
	</div>
	<div class="row">
			<div class="container">
					<div class="jumbotron border" style="background-color:white; padding-top:20px; padding-bottom:0px;">
						<h4>Contact info</h4><br><br>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td class="td_css">EMAIL</td>
									<td class="td_bold"><%=studentEmail%></td>
									<td><a href="personalinfoStudentEmail.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
								</tr>
								<tr>
									<td class="td_css">CONTACT</td>
									<td class="td_bold"><%=studentPhone%></td>
									<td><a href="personalinfoStudentContact.jsp"><span class="glyphicon glyphicon-chevron-right"></span></a></td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
	</div>
</div>

</body>
</html>