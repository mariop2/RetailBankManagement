<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Customer</title>
</head>
<body>
<% session.setAttribute("value", "custDeleteSearch"); %>

<form action = "webServlet" method = "post">
	<div class = "flexbox">
		<h3> Note: If Page Reloads the Customer Was Not Found</h3>
	        <div class = "searchnav">Customer SSN -or- ID Search
	            <input type="number" placeholder="Enter CustomerID/SSID" name="custid">
	            <button type="submit">Search</button>
	        </div>
	</div>
</form>
</body>
</html>