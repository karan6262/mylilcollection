<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="java.sql.*" %><%
             String mail = request.getParameter("email");
            if (mail.contains("@") && mail.contains(".")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
                    Statement s = con.createStatement();
                    PreparedStatement ps = con.prepareStatement("select * from user_details where u_email=?");
                    ps.setString(1, mail);
                    ResultSet rs = ps.executeQuery();
                    int j =0;
                    while(rs.next()){
                        j++;
                    }
                    if (j==0) {
                        out.println("<br/>This Email id is not registered with any Account.You have to SignUp. ");
                    } else {
                       // out.print("Available!");
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            } else {
                out.print("Invalid email!");
            }
        %>