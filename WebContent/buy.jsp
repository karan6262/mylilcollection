
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
    String id = request.getParameter("id").toString();
    String uid = session.getAttribute("id").toString();
    java.text.SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");

    java.util.Date currentDate = new java.util.Date();
    Calendar cl = Calendar.getInstance();
    cl.setTime(currentDate);
    cl.add(Calendar.DATE, 2);
//    java.text.SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");

    currentDate = cl.getTime();
    String sql = "insert into order_detail(u_id,prod_id,returndate) values ('" + uid + "','" + id + "','"+currentDate+"')";
    Statement st = con.createStatement();
    int i;
    try {
        i = st.executeUpdate(sql);

    } catch (Exception e) {
        out.print(e.getMessage());
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>mylilcollection</title>
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
		
    </head>
    <body>
        <div class="main">
            <div class="logo-photo">
                <a href="index.jsp"><img src="logo.png" alt="logo" height="75" width="150"></a>
            </div>

            <div class="header">
                <h2> <span class="logo"><a href="index.jsp">my lil collection</a></span></h2>
            </div>

            <div class="menubar">
                <ul>
                    <a href="#">
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

                            %>                                    <li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li><% }%>

                </ul>
            </div>
            <div style="align-content: center"><img src="images/RQkCwnPag.jpg" style="align-items: center;margin:0px 400px" height="500" width="425"/></div>
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
