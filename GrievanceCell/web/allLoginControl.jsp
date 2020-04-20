<%-- 
    Document   : allLogin
    Created on : Feb 25, 2019, 1:34:37 AM
    Author     : admi-n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<%
    String login=request.getParameter("login");
    
    if(login.equals("parentlogin"))
    {
        String roll=request.getParameter("parentId");
        String stuPass=request.getParameter("parentPass");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from parentsignup where stuRollNo=? and password=?");
            st.setString(1, roll);
            st.setString(2, stuPass);
            ResultSet rs=st.executeQuery();
            session.setAttribute("stuRoll",roll);
            if(rs.next())
            {
                session.setAttribute("parentName",rs.getString(1));
                response.sendRedirect("parentIssue.jsp");
            }
            else
            {
                session.setAttribute("pValidationMsg", "Wrong Id Password.");
                response.sendRedirect("index.jsp");
                
            }
        }catch(Exception e){out.print(e);}

    }
    
    if(login.equals("stulogin"))
    {
        String roll=request.getParameter("studentId");
        String stuPass=request.getParameter("studentPass");
    
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from stusignup where rollNo=? and password=?");
            st.setString(1, roll);
            st.setString(2, stuPass);   
            ResultSet rs=st.executeQuery();
            session.setAttribute("rollNo",roll);
            if(rs.next())
            { 
                
                
                String firstname=rs.getString(1);
               
                session.setAttribute("studentFirstName",firstname);
                
                String lastname=rs.getString(2);
                session.setAttribute("studentLastName",lastname);
                
                session.setAttribute("studentRollNo",roll);
                
                String studentBranch=rs.getString(4);
                session.setAttribute("studentBranch",studentBranch);
                
                String studentYear=rs.getString(5);
                session.setAttribute("studentYear",studentYear);
                
                String studentSem=rs.getString(6);
                session.setAttribute("studentSem",studentSem);
                
                String studentPhone=rs.getString(7);
                session.setAttribute("studentPhone",studentPhone);
                
                String studentEmail=rs.getString(8);
                session.setAttribute("studentEmail",studentEmail);
    
                String studentPass=rs.getString(9);
                session.setAttribute("studentSem",studentPass);

                response.sendRedirect("stuIssuePage.jsp");
            }
            else
            {
                session.setAttribute("sValidationMsg", "Wrong Id Password.");
                response.sendRedirect("index.jsp");
                
            }
        }catch(Exception e){out.print(e);}
                                                        

    }
    
    if(login.equals("flogin"))
    {
        String facultyId=request.getParameter("facultyId");
        String facultyPass=request.getParameter("facultyPass");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement st=con.prepareStatement("select * from fsignup where facultyId=? and password=?");
        st.setString(1, facultyId);
        st.setString(2, facultyPass);
        ResultSet rs=st.executeQuery();
        session.setAttribute("fId", facultyId);
        if(rs.next())
        {   
            session.setAttribute("facultyId",facultyId);
            session.setAttribute("facultyFirstName",rs.getString(1));
            session.setAttribute("facultyLastName",rs.getString(2));
            session.setAttribute("designation", rs.getString(5));
            session.setAttribute("branch", rs.getString(4));
            response.sendRedirect("HPRPage.jsp");
        }else{
                
                session.setAttribute("X", "true");
                session.setAttribute("fValidationMsg", "Wrong Id Password.");
                response.sendRedirect("index.jsp");
                

            }

    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

