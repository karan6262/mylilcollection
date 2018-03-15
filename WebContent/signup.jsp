<%-- 
    Document   : signup
    Created on : 12 Apr, 2017, 5:09:05 PM
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

        <%@page import="java.sql.*" %>
        <% 
            String email = request.getParameter("u_email");
            String password = request.getParameter("u_pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
            Statement st = con.createStatement();
            //Statement s = con.createStatement("select * from user_details where u_email=? and u_pass=?");
            //ps.setString(1, email);
            //ps.setString(2, password);
             
            if(email == "cesocetg5@mylilcollection.com" && password == "jasprk123"){
               out.println("sa");
                response.sendRedirect("WP-ADMIN/index.jsp");
            }else{
                
         
            
            ResultSet rs = st.executeQuery("select * from user_details where u_email='"+email+"' and u_pass='"+password+"'");
           
            if (rs.next()) {
              // int s =st.executeQuery("select u_name from user_detail where u_email='"+email+"'");
              String s  = rs.getString("u_fname");
              session.setAttribute("user", s);
              session.setAttribute("id",rs.getString("u_id"));
              response.sendRedirect("index.jsp");
            }
            rs.close();
       
          
        %>
        
      
    </body>
</html>
