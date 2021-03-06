<%-- 
    Document   : facultyPage
    Created on : Mar 10, 2019, 12:00:27 AM
    Author     : admi-n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>

<%
    String facultyId=(String)session.getAttribute("facultyId");
    String design=(String)session.getAttribute("designation");
    String firstName=(String)session.getAttribute("facultyFirstName");
    String lastName=(String)session.getAttribute("facultyLastName");
    String branch=(String)session.getAttribute("branch");
    
    ArrayList<Integer> stuList1=new ArrayList<Integer>();
    ArrayList<String> stuList2=new ArrayList<String>();
    ArrayList<String> stuList3=new ArrayList<String>();
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st=con.prepareStatement("select * from stu_replay where rollno=?");
    st.setString(1, facultyId);
   
    ResultSet rs=st.executeQuery();
    
    while(rs.next())
    {   
        stuList1.add(rs.getInt(1));
        stuList2.add(rs.getString(3));
        stuList3.add(rs.getString(4));
        
    }
    Collections.reverse(stuList1);
    Collections.reverse(stuList2);
    Collections.reverse(stuList3);
   
    
%>

<!DOCTYPE html>
<html>
    
<head>
    <title>Faculty Reply View Page</title>
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
	<div class="collapse navbar-collapse" id="myMenu">
		<ul class="navbar-nav ml-auto"> 
                    <li class="nav-item"><a href="facultyIssuePage.jsp" class="nav-link ">Register Issue</a></li>
                    <li class="nav-item"><a href="facultyPreviousIssuePage.jsp" class="nav-link">View Previous Grievance</a></li>
                    <li class="nav-item"><a href="facultytReplyViewPage.jsp" class="nav-link active">View Reply</a></li>
			<li class="nav-item"><a href="#" class="nav-link">Settings</a></li>
			<button class="btn btn-success" data-target="#signupModal" data-toggle="modal"><span class="glyphicon glyphicon-user"></span>Sign Up</button>
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

<!-- Info Jumbotron-->
<div class="container"> 
	<div class="jumbotron" style="background: #FA8072;">
            <h2><b>Name:<%=firstName.concat(" ").concat(lastName).toUpperCase()%></b></h2>
		<h2><b>Roll No:<%=facultyId%></b></h2>
		<h2><b>Branch:<%=branch%><b/></h2>
	</div>
</div>

<div class="container">
	<table class="table table-dark table-sm table-striped">
		<thead>
			<tr>
				<th scope="col">Issue ID</th>
				<th scope="col">Date</th>
				<th scope="col">Reply</th>
				<th scope="col">View Full Reply</th>
			</tr>
		</thead>
		<tbody>
                        
                  <%
              for(int i=0;i<stuList1.size(); i++)
                {
                    int fetchediid=stuList1.get(i);
                    String iid="I"+fetchediid;
                %> 
                <form action="facultyReplyDescriptionPage.jsp" method="post">
            <tr>
            <td><input type="text" value="<%=iid%>" readonly="readonly" name="issueId"/></td>
            <td><%=stuList2.get(i)%></td> 
            <td><%=stuList3.get(i)%></td> 
            <td><input type="submit" value="view" class="btn btn-secondary"/></td>
            </tr>
            </form>
            <%}%> 
		</tbody>
	</table>
</div>
</body>
</html>



