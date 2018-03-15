<%@page import="java.util.*"%>
<%@page import="java.sql.*, mylilcollection.*"%>
<%
	String URL = "jdbc:mysql://localhost:3306/mylilcollection";
	String USERNAME = "root";
	String PASSWORD = "";

	Connection con = null;
	con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

	String id = request.getParameter("id");
	HashMap<String, Integer> cart;
	if (session.getAttribute("cart") != null) {
		cart = (HashMap<String, Integer>) session.getAttribute("cart");
	} else {
		cart = new HashMap<String, Integer>();
	}
	if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
		cart.remove(id);

	} else if (request.getParameter("action") != null && request.getParameter("action").equals("empty")) {
		cart = new HashMap<String, Integer>();

	} else if (cart.containsKey(id)) {
		int qty = (int) cart.get(id);
		qty++;
		cart.put(id, qty);

	} else {
		cart.put(id, 1);
	}
	session.setAttribute("cart", cart);
	String ids = cart.keySet().toString();
	int i = ids.length();
	ids = ids.substring(1, i - 1);

	Product cartProduct = new Product();
	String c1 = cart.toString();
	double total = 0;
	ResultSet rs = cartProduct.getProductsById(ids);
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

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 16px;
	text-decoration: none;
}

li {
	float: left;
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
					<li>Home</li>
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
				
				<%
					if (session.getAttribute("user") != null || session.getAttribute("user") == "") {
						String uname = session.getAttribute("user").toString();
				%>
				<li class="dropdown active"><div>
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

		<div id="site">
			<div id="content">
				<h1>Your Shopping Cart</h1>
				<form id="shopping-cart" action="cart.html" method="post">
					<table class="shopping-cart">
						<thead>
							<tr>
								<th scope="col">Image</th>
								<th scope="col">Name</th>
								<th scope="col">Price</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody>
							<%
								while (rs.next()) {
							%>
							<tr>
								<td height="150"><center>
										<img src="images/<%=rs.getString("prod_image")%>" height="120"
											width="100">
									</center></td>
								<td><%=rs.getString("prod_name")%></td>
								<td><%=rs.getInt("prod_price")%></td>
								<td class="pdelete"><a
									href="cart.jsp?id=<%=rs.getString("prod_id")%>&action=delete">x</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<p id="sub-total">
						<strong>Sub Total</strong>: <span id="stotal"></span>
					</p>
					<div id="shopping-cart-actions" class="cartButton">
						<div class="divCartButton">
							<a href="cart.jsp?action=empty"> <input type="button"
								name="delete" id="empty-cart" value="Empty Cart">
							</a>
						</div>
						<div class="divCartButton">
							<input type="button" name="continueShopping"
								id="continue-shopping" value="Continue Shopping">
						</div>
						<div class="divCartButton">
							<input type="button" name="goToCheckout" id="gotocheckout"
								value="Go To Checkout">
						</div>

					</div>
				</form>

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


