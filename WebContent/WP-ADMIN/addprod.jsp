<%-- 
    Document   : add-product
    Created on : 12 Apr, 2017, 11:13:22 AM
    Author     : rankit
--%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <%try{
            Class.forName("com.mysql.jdbc.Driver");
            String name="", detail="", cat="", type="",size="";
            double p=0.0;
// double price;
          //  String price = null;
            name = null;
            // int pr = Integer.parseInt(request.getParameter("price"));
///out.print(name);
           // double p = (double) Double.parseDouble(price);
            
            //price = Double.parseDouble(p);
          //  cat = request.getParameter("cat");
          //  type = request.getParameter("type");
          //  detail = request.getParameter("detail");
            String ImageFile = "";
            String itemName = "";

            //String size = request.getParameter("size");
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    out.println("Error" +e.getMessage());
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String iname = item.getFieldName();
                        String value = item.getString();
                        if(iname.equals("name")){
                            name = value;
                        }
                        if(iname.equals("price")){
                            String price =value;
                            p =Double.parseDouble(price);
                            double pri = Double.valueOf(p);
                        }
                        if(iname.equals("detail")){
                            detail = value;
                        }
                        if(iname.equals("cat")){
                            cat = value;
                            
                        }
                        if(iname.equals("type")){
                            type = value;
                        }
                        if(iname.equals("size")){
                            size = value;
                        }
                        
                        
                        if (iname.equals("ImageFile")) {
                            ImageFile = value;
                        }
                    } else {
                        try {
                            itemName = item.getName();
                            File savedFile = new File(config.getServletContext().getRealPath("/") + "images\\" + itemName);
                            item.write(savedFile);
                        } catch (Exception e) {
                            out.println("Error" + e.getMessage());
                        }
                    }
                    
                }

            }
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");

            Statement s = con.createStatement();
            try {
                String str = "insert into prod_detail(prod_name,prod_price,prod_cat,prod_type,prod_detail,prod_image,prod_size) values(?,?,?,?,?,?,?)";
                PreparedStatement stmt = con.prepareStatement(str);
                stmt.setString(1, name);
               stmt.setDouble(2, p);
              //  stmt.setDouble(2, p);
                stmt.setString(3, cat);
                stmt.setString(4, type);
                stmt.setString(5, detail);
                stmt.setString(6, itemName);
                stmt.setString(7, size);
                int i = stmt.executeUpdate();
                // int i = s.executeUpdate("insert into prod_detail(prod_name,prod_price,prod_cat,prod_type,prod_detail,prod_image,prod_size) values('" + name + "','" + p + "','" + cat + "','" + type + "','" + detail + "','" + itemName + "')");
                if (i > 0) {
                    response.sendRedirect("addprod.html");
                }
            } catch (Exception e) {
                e.printStackTrace();
                // pw.print(e);
                
            }
             s.close();
            con.close();
        }catch(Exception e){
            out.println("error"+ e.getMessage());
        }
           

            Statement st = null;

        %>
    </body>
</html>
