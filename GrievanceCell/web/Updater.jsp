<%-- 
    Document   : Updater
    Created on : Apr 12, 2019, 12:52:14 AM
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
    String updateRequest=request.getParameter("update");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    
    if(updateRequest.equalsIgnoreCase("name"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String firstName=request.getParameter("firstname");
        String lastName=request.getParameter("lastname");
        PreparedStatement st=con.prepareStatement("update stusignup set firstName=?,lastName=? where rollNo=?");
        st.setString(1, firstName);
        st.setString(2, lastName);
        st.setString(3, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
    
    if(updateRequest.equalsIgnoreCase("year"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String year=request.getParameter("year");
        PreparedStatement st=con.prepareStatement("update stusignup set year=? where rollNo=?");
        st.setString(1, year);
        st.setString(2, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
    
    if(updateRequest.equalsIgnoreCase("semester"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String sem=request.getParameter("semester");
        PreparedStatement st=con.prepareStatement("update stusignup set semester=? where rollNo=?");
        st.setString(1, sem);
        st.setString(2, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
                                                        
    if(updateRequest.equalsIgnoreCase("email"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String email=request.getParameter("email");
        PreparedStatement st=con.prepareStatement("update stusignup set email=? where rollNo=?");
        st.setString(1, email);
        st.setString(2, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
    
    if(updateRequest.equalsIgnoreCase("phone"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String phoneNo=request.getParameter("phone");
        PreparedStatement st=con.prepareStatement("update stusignup set phoneNo=? where rollNo=?");
        st.setString(1, phoneNo);
        st.setString(2, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
    
    if(updateRequest.equalsIgnoreCase("password"))
    {
        String stuRollNo=(String)session.getAttribute("studentRollNo");
        String pass=request.getParameter("pass");
        PreparedStatement st=con.prepareStatement("update stusignup set password=? where rollNo=?");
        st.setString(1, pass);
        st.setString(2, stuRollNo);
        st.executeUpdate();
        response.sendRedirect("personalinfoStudent.jsp");
    }
    
    
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
