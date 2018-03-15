<%-- 
    Document   : newjsp
    Created on : 12 Apr, 2017, 3:20:51 PM
    Author     : rankit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
            Statement s = con.createStatement();
            String fname = request.getParameter("firstname");
            String lname = request.getParameter("lastname");
            String upass = request.getParameter("password");
            String umail = request.getParameter("email_id");
            String ucpass = request.getParameter("confirm_password");
            String ucon = request.getParameter("contactno");
            String uadd = request.getParameter("address");
            int upin = Integer.parseInt(request.getParameter("pincode"));
            String sql = "INSERT INTO `mylilcollection`.`user_details` (`u_fname`, `u_lname` , `u_pass`, `u_email`, `u_add`, `u_contact`, `u_pin`) VALUES ('" + fname + "', '"+lname+"','" + upass + "', '" + umail + "', '" + uadd + "', '" + ucon + "', '" + upin + "')";
            //    String sql = "insert into user_details(u_name,u_pass,u_email,u_add,u_contact,u_pin) values('" + uname + "','" + upass + "','" + umail + "','" + uadd + "','" + ucon + "','" + upin + "')";
            
                int i = s.executeUpdate(sql);
                if (i > 0) {
                    response.sendRedirect("login.html");
                }
            
          
            
            s.close();
            con.close();
        %> 
    </body>
</html>
