<%-- 
    Document   : stuIssuepro
    Created on : Mar 4, 2019, 10:19:01 PM
    Author     : admi-n
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*session.setAttribute("studentEmail", null);*/
    session.removeAttribute("rollNo");
    session.invalidate();
    response.sendRedirect("index.jsp");

%>