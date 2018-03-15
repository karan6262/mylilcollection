<%@ page import="java.sql.*,java.util.*,java.text.*" %>

<%
    Class.forName("com.mysql.jdbc.Driver");
%>
<%!
    public class Item {

        String URL = "jdbc:mysql://localhost:3306/mylilcollection";
        String USERNAME = "root";
        String PASSWORD = "";

        Connection con = null;
        PreparedStatement selectItem = null;

        public Item() {
            try {
                con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public ResultSet getItem(String id) {
            ResultSet rs = null;
            try {
                selectItem = con.prepareStatement("SELECT * FROM prod_detail where prod_id = " + id);
                rs = selectItem.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return rs;

        }
    }
%>
<%    java.text.SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");

    java.util.Date currentDate = new java.util.Date();
    Calendar cl = Calendar.getInstance();
    cl.setTime(currentDate);
    cl.add(Calendar.DATE, 2);
//    java.text.SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");

    currentDate = cl.getTime();
%>
<%
    if (request.getParameter("prod_id") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String id = request.getParameter("prod_id");
        Item items = new Item();
        ResultSet item = items.getItem(id);

        item.next();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title><%= item.getString("prod_name")%>| mylilcollection</title>
        <link rel="shortcut icon" href="logo.png" type="image/x-icon">
        <link rel="icon" href="logo.png" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="main.css">
        <link href="https://fonts.googleapis.com/css?family=Unica+One&amp;subset=latin-ext" rel="stylesheet">
       <style type="text/css">

/* The dropdown container */
.dropdown {
	float: left;
}

/* Dropdown button */
.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	/* Important for vertical align on mobile phones */
	margin: 0; /* Important for vertical align on mobile phones */
}

/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: #fb9084;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
	background-color: #fb9084;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}
</style>
       
    </head><!--/head-->
    <body>
        <div class="main">
            <div class="logo-photo">
                <a href="index.jsp"><img src="logo.png" alt="logo" height="75" width="150"></a>
            </div>
            <div class="header">
                <h2> <span class="logo"><a href="index.jsp">my lil collection</a></span></h2>
            </div>
            
		<div class="search">
			<input type="text" placeholder="Search" size="10px">
		</div>
            
            <div class="menubar">
                <ul>
                    <a href="index.jsp">
                        <li class="active">Home</li>
                    </a>
                    <a href="shop.jsp">
                        <li> Shop</li>
                    </a>
                    <a href="wheretobuy.jsp">
                        <li>Where to Buy</li>
                    </a>
                    <a href="contactus.jsp">
                        <li>Contact Us</li>
                    </a>
                    <%
					if (session.getAttribute("user") != null || session.getAttribute("user") == "") {
						String uname = session.getAttribute("user").toString();
				%>
				<li class="dropdown"><div>
						<span class="dropbtn"> <%
 	out.print(uname);
 %> <i class="fa fa-caret-down"></i>
						</span>
						<div class="dropdown-content">
							<a href="cart.jsp">My Cart</a> <a href="#">Change Password</a> <a
								href="logout.jsp">Logout</a>
						</div>
					</div></li>
				<%
					} else {
				%>
				<li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
				<%
					}
				%>
                    
                    <%                        if (session.getAttribute("user") != null || session.getAttribute("user") == "") {
                    %>
                    <a href="logout.jsp"> <li>logout</li></a>
                        <% } else {

                        %>                                    <li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li><% } %>

                </ul>
            </div>
            <% //item.next();{ %>
            <div class="item">
                <div class="item-img">
                    <img  src="images/<%= item.getString("prod_image")%>" height="500" width="450"><br/>
                </div>
                <div class="item-det">
                    <p class="itemview" align="justify">
                        <b class="price">Price : </b>&#x20b9 <%= item.getInt("prod_price")%><br/>
                        <b>Name: </b><%=item.getString("prod_name")%><br/>
                        <b>Description :</b><%= item.getString("prod_detail")%><br/><br/>
                    <p>Return Date: <%out.print(currentDate);%></p>
                    <%      if(session.getAttribute("user")==null){%>
   <a href="login.html" class="addtocart"><button>Get it Now</button></a><br/>
                   
   <%}
   else{%>
   
   <a href="cart.jsp?id=<%= item.getInt("prod_id")%>" class="addtocart"><button>Get it Now</button></a><br/>
   <%}%>
   
                    </p>
                </div>
            </div><% item.close();%>

         
            <div class="footer">
                <div class="col-1">
                    <p>
                    <h2>Support</h2></p>
                    <a href="contact.html">Contact us |</a></li>
                    <a href="#">FAQ | </a>
                    <a href="#">Career | </a>
                    <a href="#">Cancellation policy | </a>
                    <a href="#">Return Policy | </a>
                    <a href="#">T&C</a>
                </div>
                <div class="col-2">
                    <div>
                        <p>
                        <h2>About Us</h2></p>
                        <ul>
                            <li><a href="#">Our Story</a></li>
                        </ul>
                    </div>
                </div>


            </div>
            <div class="mrq">
                <marquee>180018001008 ||  For immediate solution Call between 9AM to 6PM</marquee>
            </div>
        </div>
    </body>
</html>
<% }
%>