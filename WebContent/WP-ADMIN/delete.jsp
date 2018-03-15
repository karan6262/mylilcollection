<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
   out.println("123");
    String id = request.getParameter("prod_id").toString();
    out.println(id);
    
    int pid=Integer.parseInt(id);
    out.println(pid);
    //Statement st=con.createStatement();
      String  sql="delete from prod_detail where prod_id=?";
    PreparedStatement ps=con.prepareStatement(sql);
    ps.setInt(1,pid);
    int i = ps.executeUpdate();
    if(i>0)
    {
        response.sendRedirect("products.jsp");
    }
  
  
%>