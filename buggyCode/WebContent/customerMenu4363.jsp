<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>

<% session.setAttribute("value", "custMenu"); %>


</head>
<body>
	<h1>Table</h1>
	<%
	Connection con = null;
    
	Statement stCustomer = null;
	Statement stAccoounts = null;
	try
    {
        PrintWriter pw=response.getWriter();
        Class.forName("oracle.jdbc.driver.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bms", "abcd");
		
		pw.print(con);
		 stCustomer = con.createStatement();
		 stAccoounts = con.createStatement();
		ResultSet rsCustomers = stCustomer.executeQuery("SELECT * FROM tbl_Customer");
		
		
		ResultSet rsAccounts = stAccoounts.executeQuery(
				"SELECT c.ID, c.NAME, c.AGE, c.CITY, c.STATE, a.ID, a.TYPE, a.BALANCE, a.STATUS FROM tbl_Customer c INNER JOIN tbl_Intermediate i ON c.ID = i.CUSTOMERID INNER JOIN tbl_Account a ON a.ID = i.ACCOUNTID");
		
	%>
	 <form name="custMenu" action="webServlet" method="post">
	 <div class="container">
		<div class="center">
			<input class="disbtn" onclick="tableDisplayAcct()" type="submit" value="Customers Table" >
			<input class="disbtn" onclick="tableDisplayCust()" type="submit" value="Accounts Table" >
			<input class="disbtn" type="submit" value="Create Customer" name="sub">
			<input class="disbtn" type="submit" value="Update Customer" name="sub">
			<input class="disbtn" type="submit" value="Delete Customer" name="sub">
			<input class="disbtn" type="submit" value="Add Account" name="sub">
			<input class="disbtn" type="submit" value="Delete Account" name="sub">
		</div>
	</div>
	<table border=1 style="text-align:center">
          <tr>
             <th>ID</th>
             <th>NAME</th>
             <th>AGE</th>
             <th>ADR1</th>
             <th>ADR2</th>
             <th>CITY</th>
             <th>STATE</th>
      <tbody>
        <%
		pw.print(rsCustomers.next());
        while(rsCustomers.next())
        {
        %>
            <tr>
                <td><%=rsCustomers.getString(1) %></td>
                <td><%=rsCustomers.getString(2) %></td>
                <td><%=rsCustomers.getString(3) %></td>
                <td><%=rsCustomers.getString(4) %></td>
                <td><%=rsCustomers.getString(5) %></td>
                <td><%=rsCustomers.getString(6) %></td>
                <td><%=rsCustomers.getString(7) %></td>      
            </tr>
            <%}%>
           </tbody>
        </table><br>
        
        <table border=1 align=center style="text-align: center"
			class="customers">
			<thead>
				<tr>
					<th>CUSTOMER ID</th>
					<th>CUSTOEMR NAME</th>
					<th>CUSTOEMR AGE</th>
					<th>CUSTOEMR CITY</th>
					<th>CUSTOEMR STATE</th>
					<th>ACCOUNT ID</th>
					<th>ACCOUNT TYPE</th>
					<th>ACCOUNT BALANCE</th>
					<th>ACCOUNT STATUS</th>
				</tr>
			</thead>
			<tbody>
				<% while (rsAccounts.next()) { %>
				<tr>
					<td><%=rsAccounts.getInt(1)%></td>
					<td><%=rsAccounts.getString(2)%></td>
					<td><%=rsAccounts.getInt(3)%></td>
					<td><%=rsAccounts.getString(4)%></td>
					<td><%=rsAccounts.getString(5)%></td>
					<td><%=rsAccounts.getInt(6)%></td>
					<td><%=rsAccounts.getString(7)%></td>
					<td>$<%=rsAccounts.getInt(8)%></td>
					<td><%=rsAccounts.getString(9)%></td>
				</tr>
				<% } %>	
			</tbody>
		</table>
        
    <%}
    catch(Exception e){ %> <br>
    <%
    }
    
    finally{
    	 stCustomer.close();
    	 stAccoounts.close();
    	if(con!=null) {
        con.close();
    	}
    }
    %>
    </form>
</body>
</html>