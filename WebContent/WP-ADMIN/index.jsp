<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <frameset cols="25%,*">
  <frame src="left-column.html" name="left-frame">
  <frame src=" "name="right-frame" bgcolor="red">
</frameset>
</html>
