<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% session.setAttribute("value", "accountCreate"); %>

<h3>Enter account information below to create account</h3>
<form action = "webServlet" method = "post">
	<div class = "flexbox">
		<div>Customer ID: <input type="number" name="custid"></div>
		<div>Account ID: <input type="number" name="id"></div>
	    <div>Account Type: <input type="text"name="type"></div>
	    <div>Initial Deposit Amount: <input type="number"name="amount"></div>
	    <div>Account Status: <input type="text" name="status"></div>
	    <div>Account Message: <input type="text" name="message"></div>
	    <div>Today's Date: <input type="text" name="date"></div>
	    <button type="submit">Confirm</button>
	  </div>
</form>
 <div>-------------</div>
<form action="customerMenu.jsp">
<input type="submit" value="Main Menu" />
</form>
</body>
</html>