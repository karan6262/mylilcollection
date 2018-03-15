<!DOCTYPE html>
<html>

<head>
    <link rel="shortcut icon" href="logo.png" type="image/x-icon">
    <link rel="icon" href="logo.png" type="image/x-icon">

    <title>Where to Buy</title>
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
                    <li class="active">Where to Buy</li>
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
        <div class="add-container">
            <div class="add-1">
                <p>
                    <h2>Satellite</h2>jodhpur cross road,
                    <br/>Satellite,
                    <br/>Ahmadabad
                    <br/>380015</p>
                <h3><a href="https://goo.gl/maps/JAmC2bLU1Uk" target="_blank"><input type="button" class="map-button" value="View in Map"></a></h3>
            </div>
            <div class="add-2">
                <p>
                    <h2>Satellite</h2>jodhpur cross road,
                    <br/>Satellite,
                    <br/>Ahmadabad
                    <br/>380015</p>
                <h3><a href="https://goo.gl/maps/JAmC2bLU1Uk" target="_blank"><input type="button" class="map-button" value="View in Map"></a></h3>
            </div>
            <div class="add-3">
                <p>
                    <h2>Satellite</h2>jodhpur cross road,
                    <br/>Satellite,
                    <br/>Ahmadabad
                    <br/>380015</p>
                <h3><a href="https://goo.gl/maps/JAmC2bLU1Uk" target="_blank"><input type="button" class="map-button" value="View in Map"></a></h3>
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
            <div class="col-3">
                <h1>180018001008</h1>
                <p>For immediate solution Call between 9AM to 6PM</p>
            </div>
        </div>
    </div>
</body>

</html>
