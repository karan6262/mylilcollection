
<%@page import="java.sql.*" errorPage="500-error.jsp"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylilcollection", "root", "");
	Statement st = con.createStatement();
	//int i = st.executeUpdate("select * from prod_detail");
	ResultSet rs = st.executeQuery("select * from prod_detail ORDER BY RAND() LIMIT 3");
%>


<html>

<head>
<link rel="shortcut icon" href="logo.png" type="image/x-icon">
<link rel="icon" href="logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="main.css">
<link rel="stylesheet" type="text/css" href="cloudfare.css">
<link
	href="https://fonts.googleapis.com/css?family=Unica+One&amp;subset=latin-ext"
	rel="stylesheet">
<title>Online renting Store</title>
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
			<a href="index.jsp"><img src="logo.png" alt="logo" height="75"
				width="150"></a>
		</div>

		<div class="header">
			<h2>
				<span class="logo"><a href="index.jsp">my lil collection</a></span>
			</h2>
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
					<li>Shop</li>
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
		<div class="slider">
			<img class="mySlides animate-right" src="images/header.jpg"
				width="1200" height="500"> <img class="mySlides animate-right"
				src="images/m_main.jpg" width="1200" height="500"> <img
				class="mySlides animate-right" src="images/main2.jpg" width="1200"
				height="500">
		</div>
		<script type="text/javascript">
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 5000); // Change image every 2 seconds
			}
		</script>
		<div class="content clearfix">
			<div class="header">
				<h2>Collection 2017</h2>

			</div>
			<div class="sidebar">
				<h2>Categories</h2>

				<ul class="cat-ul">
					<br />
					<br />
					<a href="accessories.jsp"><li>Accessories</li></a>
					<br />
					<a href="clothes.jsp"><li>Clothes</li></a>
					<br />
					<a href="footwear.jsp"><li>Footwear</li></a>
					<br />
					<a href="men.jsp"><li>Men's</li></a>
					<br />
					<a href="women.jsp"><li>Women's</li></a>
					<br />
					<a href="kids.jsp"><li>Kids</li></a>
					<br />
				</ul>
			</div>
			<div class="feature">
				<h2>Featured Items</h2>
				<%
					while (rs.next()) {
				%>
				<div class="col-sm-4">
					<div class="product-image-wrapper">
						<div class="single-product">
							<div class="productinfo text-center">

								<strong>
									<h4 class="hover"><%=rs.getString("prod_name")%></h4> <br />
									<h4 class="hover"><%=rs.getDouble("prod_price")%></h4> <br />
									<h4 class="hover"><%=rs.getString("prod_size")%></h4> <br />
									<h4 class="hover"><%=rs.getString("prod_cat")%></h4> <br />
									<h4 class="hover"><%=rs.getString("prod_type")%></h4> <br />
								</strong> <img src="images/<%=rs.getString("prod_image")%>">
								<h3>
									&#x20b9
									<%=rs.getDouble("prod_price")%></h3>
								<h3 class="prod-name"><%=rs.getString("prod_name")%></h3>
								<a href="item.jsp?prod_id=<%=rs.getInt("prod_id")%>"><button
										value="View">View Item</button></a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>

			</div>
		</div>
		<div class="footer">
			<div class="col-1">
				<p>
				<h2>Support</h2>
				</p>
				<a href="contact.html">Contact us |</a>
				</li> <a href="#">FAQ | </a> <a href="#">Career | </a> <a href="#">Cancellation
					policy | </a> <a href="#">Return Policy | </a> <a href="#">T&C</a>
			</div>
			<div class="col-2">
				<div>
					<p>
					<h2>About Us</h2>
					</p>
					<ul>
						<li><a href="#">Our Story</a></li>
					</ul>
				</div>
			</div>


		</div>
		<div class="mrq">
			<marquee>180018001008 || For immediate solution Call
				between 9AM to 6PM</marquee>
		</div>
	</div>

</body>

</html>
