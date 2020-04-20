<%-- 
    Document   : IssueClose
    Created on : Apr 11, 2019, 11:26:34 AM
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
    
    String requestFrom=request.getParameter("request");
    String issueId=request.getParameter("issueId");
    int newIid=Integer.valueOf(issueId.substring(1));
    String status=request.getParameter("status");
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st=con.prepareStatement("update studentissue set status=? where iid=?");
    st.setString(1, status);
    st.setInt(2, newIid);
    st.executeUpdate();
    session.setAttribute("stuIssueClosed","Issue Closed Successfully!!");
    if(requestFrom.equalsIgnoreCase("studentPage"))
    response.sendRedirect("studentPreviousIssuePage.jsp");
    if(requestFrom.equalsIgnoreCase("facultyPage"))
    response.sendRedirect("facultyPreviousIssuePage.jsp");
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
