<%-- 
    Document   : accessories
    Created on : 14 Apr, 2017, 2:16:19 PM
    Author     : karan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from prod_detail where prod_cat= 'Woman'");

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="logo.png" type="image/x-icon">
        <link rel="icon" href="logo.png" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="main.css">
        <link href="https://fonts.googleapis.com/css?family=Unica+One&amp;subset=latin-ext" rel="stylesheet">
        <title>
            Online renting Store
        </title>
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
        
    </head>
    <body>
        <div class="main">
            <div class="logo-photo">
                <a href="index.jsp"><img src="logo.png" alt="logo" height="75" width="150"></a>
            </div>
            <div class="header">
                <h2><a href="index.jsp">my lil collection</a></h2>
            </div>
            
		<div class="search">
			<input type="text" placeholder="Search" size="10px">
		</div>
            
            <div class="menubar">
                <ul>
                    <a href="index.jsp">
                        <li>Home</li>
                    </a>
                    <a href="shop.jsp">
                        <li class="active"> Shop</li>
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
                    
                    </ul>
            </div>
            <div class="header">
                <h2>Categories</h2>
            </div>
            <div class="shop-menu">
                <ul>
                    <a href="accessories.jsp"><li>Accessories</li></a>
                    <a href="clothes.jsp"><li>Clothes</li></a>
                    <a href="footwear.jsp"><li>Footwear</li></a>
                    <a href="kids.jsp"><li>Kids</li></a>
                    <a href="men.jsp"><li>Men's</li></a>

                    <a href="#"><li class="active">Women's</li></a>
                </ul>
            </div>
            <div class="shop-content">
                <%while (rs.next()) {%>
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-product">
                            <div class="productinfo text-center">
                                <strong> <h4 class="hover"><%= rs.getString("prod_name")%></h4><br/>
                                    <h4 class="hover"><%= rs.getDouble("prod_price")%></h4><br/>
                                    <h4 class="hover"><%= rs.getString("prod_size")%></h4><br/>
                                    <h4 class="hover"><%= rs.getString("prod_cat")%></h4><br/>
                                    <h4 class="hover"><%= rs.getString("prod_type")%></h4><br/></strong>
                                <img src="images/<%= rs.getString("prod_image")%>">
                                <h3><%= rs.getDouble("prod_price")%></h3>
                                <p><%= rs.getString("prod_name")%></p>
                                <a href="item.jsp?prod_id=<%= rs.getInt("prod_id")%>"><button value="View">View Item</button></a>                                </div>

                        </div>
                    </div>
                </div>
            <% }%>
            </div>
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
