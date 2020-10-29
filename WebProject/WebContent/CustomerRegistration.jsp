<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="css/web.css"> 
<script>
src = "../js/CustValidate.js"
function goBack() {
  window.history.back()
}
</script>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
 <%  session.setAttribute("value", "custRegistration"); %>
</head>
<body>
 <form name="Customerform" action="webServlet" method="post">
  <div class="container">
    <h1>Registration Page</h1>
    <label for="ssn"><b>Customer SSN</b></label>
    <input type="text" placeholder="Enter ssn" name="customerId" id="cid" required>
<br>
    <label for="name"><b>Customer Name</b></label>
    <input type="text" placeholder="name" name="customerName" id="cname" required>
    
<br>
    <label for="age"><b>Age</b></label>
    <input type="text" placeholder="Enter Age" name="customerAge" id="cage" required>
<br>
    <label for="address1"><b>Address</b></label>
    <input type="text" placeholder="Enter address" name="customerAddress1" id="caddress1" required>
<br>
    <label for="address2"><b>Address</b></label>
    <input type="text" placeholder="Enter address" name="customerAddress2" id="caddress2" required>
<br>
       <label for="city"><b>City</b></label>
    <input type="text" placeholder="city" name="customerCity" id="ccity" required>
    <br>
  <label for="state "><b>State</b></label>
   <input type="text" placeholder="state" name="customerState" id="cstate" required>
 <br>
    <button type = "submit" name = "regBtns" value = "submit">Submit</button>
    <button type = "submit" name = "regBtns" value = "mainmenu">Main Menu</button>  

  </div>
  
</form>


</body>
</html>