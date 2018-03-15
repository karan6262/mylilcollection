<%-- 
    Document   : feedback
    Created on : 12 Apr, 2017, 11:17:02 PM
    Author     : rankit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
            //String sql="insert into prod_detail(prod_name,prod_price,prod_cat,prod_type,prod_detail) values('"+name+"','"+price+"','"+cat+"','"+type+"','"+detail+"')";
            Statement s = con.createStatement();
            String f_name = request.getParameter("name");
            String f_number = request.getParameter("contact_no");
            String f_email = request.getParameter("emailid");
            String f_query = request.getParameter("query");
            
            
                int i = s.executeUpdate("insert into feedback(f_name,f_number,f_email,f_query) values('" + f_name + "','" + f_number + "','" + f_email+ "','" + f_query + "')");
                if (i > 0) {
                    response.sendRedirect("contactus.jsp");
                } 
                    %> 
    </body>
</html>
