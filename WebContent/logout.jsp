<%-- 
    Document   : logout
    Created on : 14 Apr, 2017, 10:57:59 PM
    Author     : karan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("user", null);
            session.invalidate();
             response.sendRedirect("index.jsp");
        %>
    </body>
</html>
