<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styles.css">
    <title>ABC Bank</title>
    <%  session.setAttribute("value", "execLogIn"); %>
</head>
<body>
    <!-- The Modal -->
    <div id="id01" class="modal">
        <!-- Modal Content -->
        <form name = "execLogIn" action="webServlet" method ="post" class="modal-content">
            <div class="imgcontainer">
                <img src="img/login.png" alt="Avatar" class="avatar">
            </div>
            <div class="employee">
                <p>Executive Login</p>
            </div>
    
            <div class="container">
                <label for="uname"><b> &nbsp; Username</b></label>
                <input type="text"  name="uname" >
    
                <label for="psw"><b> &nbsp; Password</b></label>
                <input type="password"  name="psw" >
    
                <button type="submit">Login</button>
                <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>
            
            <div class="container" style="background-color:#f1f1f1">
                <button class="create-btn">Create Account</button>
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
            
        </form>
        
     </div>
     
    <script src="js/script.js"></script>
</body>
</html>