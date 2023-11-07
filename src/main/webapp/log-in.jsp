<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:directive.page import="javax.websocket.Session"/>
	<jsp:directive.page contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1" session="false" />
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DVAS - Department Vehicle Application System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous"></link>
</head>
<body>
	<form action="" method="post">
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" class="col-sm-2 col-form-label">User
				Name</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" name="username"
					id="username" placeholder="name@example.com"></input>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
			<div class="col-sm-10">
				<input type="password" name="password" class="form-control"
					id="inputPassword"></input>
			</div>
		</div>
	</form>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
					if (username != null && password != null){
						try{
							String dbusername = "sa";
							String dbpassword ="p@ssw0rd";
							Connection dbconn = null;
							String sql ="SELECT * FROM login WHERE username = ? AND password = ?";
							dbconn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost/DVAS","sa","p@ssw0rd");
							PreparedStatement SQLstatement = dbconn.prepareStatement(sql);
							SQLstatement.setString(1, username);
							SQLstatement.setString(2, password);
							ResultSet resultSet = SQLstatement.executeQuery();
							
							if(resultSet.next() && resultSet.getString("username").equals(username)){
							 HttpSession session = request.getSession();
							 session.setAttribute("username", username);
							response.sendRedirect("index.jsp");
								
							} else {
								out.println("Try again");
							}
						}
						catch (Exception e){
							e.printStackTrace();
						}
					} 
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
	</html>
</jsp:root>