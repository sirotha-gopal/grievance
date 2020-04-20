<%-- 
    Document   : demo
    Created on : Feb 25, 2019, 1:05:14 AM
    Author     : admi-n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<%
    String h=request.getParameter("hid");
    if(h.equals("student"))
    {
        String fName=request.getParameter("firstName");
        String lName=request.getParameter("lastName");
        String rollNo=request.getParameter("rollNo");
        String branch=request.getParameter("branch");
        String year=request.getParameter("year");
        String sem=request.getParameter("semester");
        String pNo=request.getParameter("phoneNo");
        String email=request.getParameter("emailId");
        String pass=request.getParameter("password");
        String rePass=request.getParameter("repassword");       
        if(pass.equals(rePass))
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                 PreparedStatement st=connection.prepareStatement("insert into stuSignup values(?,?,?,?,?,?,?,?,?)");

                st.setString(1, fName);
                st.setString(2, lName);
                st.setString(3, rollNo);
                st.setString(4, branch);
                st.setString(5, year);
                st.setString(6, sem);
                st.setString(7, pNo);
                st.setString(8, email);
                st.setString(9, pass);
                    
                st.executeUpdate();

                response.sendRedirect("index.jsp");

            }catch(SQLException e){out.println(e.getMessage());}

        }else{
                out.println("Password not matched!");

             }

    }
    if(h.equals("faculty"))
    {
        String fName=request.getParameter("firstName");
        String lName=request.getParameter("lastName");
        String fId=request.getParameter("facultyId");
        String branch=request.getParameter("branch");
        String design=request.getParameter("designation");
        String pNo=request.getParameter("phoneNo");
        String email=request.getParameter("emailId");
        String pass=request.getParameter("password");
        String rePass=request.getParameter("repassword");
        if(pass.equals(rePass))
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement st=connection.prepareStatement("insert into fsignup values(?,?,?,?,?,?,?,?)");
                
                st.setString(1, fName);
                st.setString(2, lName);
                st.setString(3, fId);
                st.setString(4, branch);
                st.setString(5, design);    
                st.setString(6, pNo);
                st.setString(7, email);
                st.setString(8, pass);
   
                st.executeUpdate();
                
                response.sendRedirect("index.jsp");

            }catch(SQLException e){out.println(e.getMessage());
                                                                }

        }
        else
        {
            out.println("password not matched");   
        }
    }
    
    if(h.equals("parent"))
    {
            String fName=request.getParameter("firstName");
            String lName=request.getParameter("lastName");
            String stuRollNo=request.getParameter("rollNo");
            String pNo=request.getParameter("phoneNo");
            String email=request.getParameter("emailId");
            String address=request.getParameter("address");
            String pass=request.getParameter("password");
            String rePass=request.getParameter("repassword");
            out.print(h);
            if(pass.equals(rePass))
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                    PreparedStatement st=con.prepareStatement("insert into parentSignup values(?,?,?,?,?,?,?)");
                    st.setString(1, fName);
                    st.setString(2, lName);
                    st.setString(3, stuRollNo);
                    st.setString(4, pNo);
                    st.setString(5, email);
                    st.setString(6, address);
                    st.setString(7, pass);
                    
                    st.executeUpdate();
                    
                    response.sendRedirect("index.jsp");
                }
                catch(Exception e){ out.println(e.getMessage());}
            
            
            }
            else
            {
                out.println("Wrong Id Password!");
            
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
