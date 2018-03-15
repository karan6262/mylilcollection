<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
            PreparedStatement st = null;
            String sql = "insert into user_details values(?,?,?,?,?,?,?,?)";
            st = con.prepareStatement(sql);
            st.setInt(1, 18);
            st.setString(2,"karan");
            st.setString(3, "karan5391");
            st.setString(4, "mnopqrst@gmail.com");
            st.setString(5, "abcdefghi123456");
            st.setInt(6,321654987);
            st.setInt(7,321654);
            st.setString(8, "shah");
            int i = st.executeUpdate();
                out.println("Data inserted");
           
            
            
          
            %></h1>
    </body>
</html>
