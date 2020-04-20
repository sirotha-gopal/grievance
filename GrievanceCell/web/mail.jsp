<%-- 
    Document   : mail
    Created on : Mar 14, 2019, 12:26:06 AM
    Author     : admi-n
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page  import="java.util.*"%>
<%@page  import="javax.mail.*"%>
<%@page  import="javax.mail.internet.*"%>
<%@page  import="javax.activation.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.SecurityException"%>

<!DOCTYPE html>
<%
    Date date=new Date(); 
    SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yy");
    String sd=sdf.format(date);
    SimpleDateFormat tt= new SimpleDateFormat("HH:mm:ss aa");
    String time=tt.format(date);
    String status=request.getParameter("status");
    String stuName=request.getParameter("stuName");
    String stuRoll=request.getParameter("stuRoll");
    String reply=request.getParameter("replyMsg");
    String subject=request.getParameter("subject");
    
    String issueId=request.getParameter("issueId");
    int newIid=Integer.valueOf(issueId.substring(1));
    
    String msqlExc;
    String result=null;
    String to=request.getParameter("stuEmail");
    final String from="lnctgrievance@gmail.com";
    String host="localhost";
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    
    PreparedStatement ps=con.prepareStatement("update studentissue set status=? where iid=?");
    ps.setString(1, status);
    ps.setInt(2, newIid);
    ps.executeUpdate();
    
    PreparedStatement st=con.prepareStatement("insert into stu_replay values(?,?,?,?,?,?)");
    st.setInt(1, newIid);
    st.setString(2, stuRoll);
    st.setString(3, sd);
    st.setString(4, time);
    st.setString(5, subject);
    st.setString(6, reply);
    st.executeUpdate();
    result="entery sent";
    }catch(Exception  ex){
        out.println(ex);
     msqlExc="mysql connection problem";
    
    }

    Properties prop=new Properties();
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.starttls.enable", "true");
    prop.put("mail.smtp.host", "smtp.gmail.com");
    prop.put("mail.smtp.port", 587);
    Session s=Session.getInstance(prop, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication(){
    return new PasswordAuthentication(from, "lnctgrievance0820");}
    });
    try
    {
   
        MimeMessage message=new MimeMessage(s);
        
        message.setFrom(new InternetAddress(from));
        
         message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
         message.setSubject(subject);
         
         message.setText(reply);
        
         Transport.send(message);
         result="sent message successfully";   
    }catch(MessagingException | SecurityException mex ){ 
        mex.printStackTrace();
    out.println(mex);
    result="Error: unable to send Message";}
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mail page</title>
    </head>
    <body>
        <h1>Sending Mail</h1>
        <p align="center">
            <%
                out.println("Result: "+result+"\n");
            %>
        </p>
    </body>
</html>
