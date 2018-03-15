<!DOCTYPE html>
<html>

    <head>
        <link rel="shortcut icon" href="logo.png" type="image/x-icon">
        <link rel="icon" href="logo.png" type="image/x-icon">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({
                google_ad_client: "ca-pub-7976797046585804",
                enable_page_level_ads: true
            });
        </script>
        <link rel="stylesheet" type="text/css" href="main.css?1">
        <link href="https://fonts.googleapis.com/css?family=Unica+One&amp;subset=latin-ext" rel="stylesheet">

        <title>Contact Us</title>
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
        <div>
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
                            <li> Shop</li>
                        </a>
                        <a href="wheretobuy.jsp">
                            <li>Where to Buy</li>
                        </a>
                        <a href="contactus.jsp">
                            <li class="active">Contact Us</li>
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
                <div class="cust">
                    <div class="query">
                        <h2>Enter Your Query</h2>
                        <form method="post" action="feedback.jsp">
                            <input type="text" name="name" placeholder="Enter Your Name" >
                            <br/>
                            <input type="text" name="contact_no" placeholder="Enter your Contact No">
                            <br/>
                            <input type="email" name="emailid" placeholder="Enter Youe Email ID">
                            <br/>
                            <textarea rows="10" cols="30" placeholder="Enter your Query" name="query"></textarea>
                            <br/>
                            <input type="submit" name="submit" value="Submit">
                        </form>
                    </div>
                    <div class="partition" style="height: 535px;"></div>
                    <div class="con-detail">
                        <h2>Customer Review</h2>
                    </div>
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
