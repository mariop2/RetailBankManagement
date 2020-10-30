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
        const refreshAccount = () => {
          // call api to refresh data
        }
      </script>
      <title>Account Status</title>
      <% session.setAttribute("value", "accStatus"); %>
  </head>

  <body>
    <div class='table'>
      <div class='row'>
        <div class='col'>
          <p>Customer ID</p>
        </div>
        <div class='col'>
          <p>Account Type</p>
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
        list = (ArrayList) request.getAttribute("accounts");
      %>

      <% 
        for(int i = 0; i < list.size(); i++) {
          ArrayList temp = new ArrayList();
          temp = list.get(i);

          int id = temp.get(0);
          String type = temp.get(1);
          String status = temp.get(2);
          String msg = temp.get(3);
          String lastUpdated = temp.get(4);
      %>

      <div class='row'>
        <div class='col'>
          <p><%=id%></p>
        </div>
        <div class='col'>
          <p><%=type%></p>
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
          <button onclick='refreshAccount()'>Refresh</button>
        </div>
      </div>

      <%
      };
      %>
  
    </div>
  </body>
</html>