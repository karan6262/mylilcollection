<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%            Statement st = con.createStatement();
                String sql = "select * from order_detail";
                ResultSet rs = st.executeQuery(sql);
             %>
    <table border="1px">
        <tr>
       
            <th>Order Id</th>
            <th>User ID</th>
             <th>Product ID</th>
             <th>Return Date</th>
        </tr>
        <%while (rs.next())
        {
        %>
        
        <tr>
            <td><%= rs.getInt("od_id")%></td>
             <td><%= rs.getInt("u_id")%></td>
              <td><%= rs.getInt("prod_id")%></td>
              <td><%= rs.getString("returndate")%></td>
        </tr>
        <%}%>
    </table>
    </body>
</html>
