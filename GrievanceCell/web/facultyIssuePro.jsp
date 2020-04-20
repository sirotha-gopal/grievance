<%-- 
    Document   : stuIssuepro
    Created on : Mar 4, 2019, 10:19:01 PM
    Author     : admi-n
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<%
  //String issueId=request.getParameter("issueId");
  String facultyName=request.getParameter("facultyName");
  String facultyId=request.getParameter("facultyId");
  String date=request.getParameter("date");
  Date time=new Date();
  SimpleDateFormat sdf= new SimpleDateFormat("HH:mm:ss aa");
  String sd=sdf.format(time);
  String email=request.getParameter("email");
  String category=request.getParameter("category");
  String branch=request.getParameter("branch");
  String issue=request.getParameter("issue");
  String description=request.getParameter("description");
  
  String status="open";
  int newIid=0;  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement ps=con.prepareStatement("select * from studentissue");
    ResultSet rr=ps.executeQuery();
    
    if(rr.next())
    {
        rr.last();
        int fetchedIid=rr.getInt(1);
        newIid=fetchedIid+1;
        
        
    PreparedStatement st=con.prepareStatement("insert into studentissue values(?,?,?,?,?,?,?,?,?,?,?)");
    st.setInt(1, newIid);
    st.setString(2, facultyId);
    st.setString(3, facultyName);
    st.setString(4, date);
    st.setString(5, sd);
    st.setString(6, email);
    st.setString(7, category);
    st.setString(8, branch);
    st.setString(9, issue);
    st.setString(10, description);
    st.setString(11, status);
    st.executeUpdate();
    response.sendRedirect("facultyIssuePage.jsp");
    
    session.setAttribute("fSuccessMsg", "sent successfully");

        
    }else{
        
    newIid=1;
    
    PreparedStatement st=con.prepareStatement("insert into studentissue values(?,?,?,?,?,?,?,?,?,?,?)");
    st.setInt(1, newIid);
    st.setString(2, facultyId);
    st.setString(3, facultyName);
    st.setString(4, date);
    st.setString(5, sd);
    st.setString(6, email);
    st.setString(7, category);
    st.setString(8, branch);
    st.setString(9, issue);
    st.setString(10, description);
    st.setString(11, status);
    st.executeUpdate();
    response.sendRedirect("facultyIssuePage.jsp");
    
    session.setAttribute("fSuccessMsg", "sent successfully");
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Issue Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
