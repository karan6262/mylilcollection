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
        <a href ="addprod.html"><input type="button" value="Add Product"/></a><br/>
            <%            Statement st = con.createStatement();
                String sql = "select * from prod_detail";
                ResultSet rs = st.executeQuery(sql);

            %>
        <table border="1px">
        <tr>
           
            <th>Id</th>
            <th>Name</th>
            <th>Product Category</th>
            <th>Type</th>
            <th>Image</th>
            <th>Price</th>
            <th>Size</th>
            <th>Delete</th>
        </tr>
        <%            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("prod_id")%></td>
            <td><%= rs.getString("prod_name")%></td>
            <td><%= rs.getString("prod_cat")%></td>
            <td><%= rs.getString("prod_type")%></td>
            <td><img src="../images/<%= rs.getString("prod_image")%>"></td>
            <td><%= rs.getDouble("prod_price")%></td>
            <td><%= rs.getString("prod_size")%></td>
            <td><a href="delete.jsp?prod_id=<%= rs.getString("prod_id")%>"><input type="button" value="delete" ></a></td>
        </tr>
        <%
            }
        %>



    </table>

</body>
</html>
