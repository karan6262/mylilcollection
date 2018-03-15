<%-- 
    Document   : session
    Created on : 14 Apr, 2017, 10:19:37 PM
    Author     : karan
--%>

<%@page import="java.sql.*" %>
<%
    String uname = (String) session.getAttribute("user");
    response.sendRedirect("index.jsp");
%>     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%out.print(uname);%>
        <%%><br/>

    </body>
</html>
