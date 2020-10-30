<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="./css/status.css">
      <script>
        const refreshCustomer = () => {
          // call api to refresh data
        }
      </script>
      <title>Customer Status</title>
      <% session.setAttribute("value", "custStatus"); %>
  </head>

  <body>
    <div class='table'>
      <div class='row'>
        <div class='col'>
          <p>SSN ID</p>
        </div>
        <div class='col'>
          <p>Status</p>
        </div>
        <div class='col'>
          <p>Message</p>
        </div>
        <div class='col'>
          <p>Last Updated</p>
        </div>
        <div class='col'>
          <p>Refresh Button</p>
        </div>
      </div>

      <%
        ArrayList list = new ArrayList();
        list = (ArrayList) request.getAttribute("customers");
     %>

      <% 
        for(int i = 0; i < list.size(); i++) {
          ArrayList temp = new ArrayList();
          temp = list.get(i);

          String name = temp.get(0);
          String status = temp.get(1);
          String msg = temp.get(2);
          String lastUpdated = temp.get(3);
          
      %>

      <div class='row'>
        <div class='col'>
          <p><%=name%></p>
        </div>
        <div class='col'>
          <p><%=status%></p>
        </div>
        <div class='col'>
          <p><%=msg%></p>
        </div>
        <div class='col'>
          <p><%=lastUpdated%></p>
        </div>
        <div class='col'>
          <button onclick='refreshCustomer()'>Refresh</button>
        </div>
      </div>

      <%
      };
      %>
    </div>
  </body>
</html>