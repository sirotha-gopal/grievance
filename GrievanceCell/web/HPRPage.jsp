<%-- 
    Document   : facultyPage
    Created on : Mar 10, 2019, 12:00:27 AM
    Author     : admi-n
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>

<%
    int fetchediid;
    String container=null;
    String cricle=null;
    int counter=0;
    String design=(String)session.getAttribute("designation");
    String firstName=(String)session.getAttribute("facultyFirstName");
    String lastName=(String)session.getAttribute("facultyLastName");
    String branch=(String)session.getAttribute("branch");

    String fullName=firstName.concat(" ").concat(lastName);
    fullName=fullName.toUpperCase();
    
    
    ArrayList<String> list1=new ArrayList<String>();
    ArrayList<String> list2=new ArrayList<String>();
    ArrayList<Integer> list3=new ArrayList<Integer>();
    ArrayList<String> list4=new ArrayList<String>();
    
    if(design.equals("HOD"))
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st=con.prepareStatement("select * from studentissue where branch=?");
    st.setString(1, branch);
   
    ResultSet rs=st.executeQuery();
    
    while(rs.next())
    {   
        if(rs.getString(7).equals("Faculty") || rs.getString(7).equals("Subject") || rs.getString(7).equalsIgnoreCase("regarding any student") )
        {
        list1.add(rs.getString(4));
        list2.add(rs.getString(9));
        list3.add(rs.getInt(1));
        list4.add(rs.getString(11));
        }
    }
    }
    if(design.equals("Principal"))
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement st=con.prepareStatement("select * from studentissue");
        ResultSet rs=st.executeQuery();
       
        while(rs.next())
        {   
            if(rs.getString(7).equalsIgnoreCase("HOD") || rs.getString(7).equalsIgnoreCase("Registrar"))
            {
            list1.add(rs.getString(4));
            list2.add(rs.getString(9));
            list3.add(rs.getInt(1));
            list4.add(rs.getString(11));
            }
        }
    
     }
    
    if(design.equals("Registrar"))
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement st=con.prepareStatement("select * from studentissue");
        ResultSet rs=st.executeQuery();
        
        while(rs.next())
        {   
            if(rs.getString(7).equals("Sports") || rs.getString(7).equals("Accounts") || rs.getString(7).equals("Bus") || rs.getString(7).equals("Management") || rs.getString(7).equals("Library") || rs.getString(7).equals("Hostel") || rs.getString(7).equalsIgnoreCase("salary") || rs.getString(7).equalsIgnoreCase("regarding management"))
            {
                list1.add(rs.getString(4));
                list2.add(rs.getString(9));
                list3.add(rs.getInt(1));
                list4.add(rs.getString(11));
            }
        }
    
    }
   
    Collections.reverse(list1);
    Collections.reverse(list2);
    Collections.reverse(list3);
    Collections.reverse(list4);
    
    if(design.equalsIgnoreCase("faculty"))
    {
        response.sendRedirect("facultyIssuePage.jsp");
    }
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>HPRPage</title>
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
          
                
            /* G r e e n  R a d i o */
            input[name='gr']+span
           {
               font-family: Arial;
               font-size: 15px;
               color: green;
            }
            
            input[name='gr']:checked+span{
                
                color: green;
                
            }
            input[name='gr']
            {
                display: none;
            }
            input[name='gr']+span:before
            {
                content: "";
                display: inline-block;
                width: 25px;
                height: 25px;
                border: 2px solid green;
                border-radius: 50%;
                margin-bottom: -7px;
            }
            input[name='gr']:checked+span:before{
                background: radial-gradient(green,#fff,green);
                margin-left: 8px;;
            }

            
                  /* Y e l l o w  R a d i o */
            input[name='yll']+span
           {
               font-family: Arial;
               font-size: 15px;
               color: yellow;
            }
            
            input[name='yll']:checked+span{
                
                color: yellow;
                
            }
            input[name='yll']
            {
                display: none;
            }
            input[name='yll']+span:before
            {
                content: "";
                display: inline-block;
                width: 25px;
                height: 25px;
                border: 2px solid yellow;
                border-radius: 50%;
                margin-bottom: -7px;
            }
            input[name='yll']:checked+span:before{
                background: radial-gradient(yellow,#fff,yellow);
                margin-left: 8px;
            }
            
                  /* R e d  R a d i o */
            input[name='rd']+span
           {
               font-family: Arial;
               font-size: 15px;
               color: red;
            }
            
            input[name='rd']:checked+span{
                
                color: red;
                
            }
            input[name='rd']
            {
                display: none;
            }
            input[name='rd']+span:before
            {
                content: "";
                display: inline-block;
                width: 25px;
                height: 25px;
                border: 2px solid red;
                border-radius: 50%;
                margin-bottom: -7px;
            }
            input[name='rd']:checked+span:before{
                background: radial-gradient(red,#fff,red);
                margin-left: 8px;
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
			<li class="nav-item"><a href="#" class="nav-link active">Register Issue</a></li>
			<li class="nav-item"><a href="#" class="nav-link">Settings</a></li>
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
		<h2><b><%=fullName%></b></h2>
		<h2><b><%=design%></b></h2>
		<h2><b><%=branch%><b/></h2>
	</div>
</div>

<div class="container"> 
	<div class="jumbotron" style="background: white;">
            <label>
                    <input type="radio"  name="gr" checked />
                <span>Issue Open</span>
                </label>
                <label>
                    <input type="radio"  name="yll" checked />
                <span>Issue Under Process</span>
                </label>
                <label>
                    <input type="radio"  name="rd" checked />
                <span>Issue Closed</span>
                </label>
	</div>
</div>

        
<div class="container">
	<table class="table table-dark table-sm table-striped">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Date</th>
				<th scope="col">Issue</th>
				<th scope="col">Status</th>
				<th scope="col">View Issue</th>
			</tr>
		</thead>
		<tbody>
                        
                <%
              for(int i=0;i<list1.size(); i++)
                 {
                    fetchediid=list3.get(i);
                    String iid="I"+fetchediid;
                %> 
                <form action="HPRIssueViewPage.jsp" method="post">
            <tr>
            <td><input type="text" value="<%=iid%>" readonly="readonly" name="issueId"/></td>
            <td><%=list1.get(i)%></td> 
            <td><%=list2.get(i)%></td>
            <%  
                if(list4.get(i).equalsIgnoreCase("open"))
                {   
                     container="gr";
                }    
                if(list4.get(i).equalsIgnoreCase("underprocess"))
                {
                    container="yll";
                }
                if(list4.get(i).equalsIgnoreCase("close"))
                {
                    container="rd";
                }
                
            %>
            <td><label>
                    <input type="radio"  name="<%=container%>" checked />
                <span></span>
                </label>
            </td> 
            <td><input type="submit" value="view" class="btn btn-secondary"/></td>
            </tr>
            </form>
            <%}%> 
		</tbody>
	</table>
          
</div>
</body>
</html>



