<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Petty Cash Book</title>
<link rel="stylesheet" href="style.css"/>
    <style>
        /* Style for the wrapper div */
        .table-wrapper {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        /* Style for each individual table */
        .table {
            border: 1px solid #ccc;
            border-collapse: collapse;
            width: 48%; /* Adjust the width as needed */
        }
        
        /* Style for table headers */
        .table th {
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            padding: 8px;
        }
        
        /* Style for table cells */
        .table td {
            border: 1px solid #ccc;
            padding: 8px;
        }
    </style>
</head>
<body>
<center><br><br><br><br><br><br>
<h1>Pretty Cash Book</h1>
 </center>
    <div class="forms">
      <div class="form-container">
          <form id="form1" method="POST" action="">
          <h2>Login Page</h2>
          <label for="name1">Username:</label>
          <input type="text" name="username" id="username" required /><br /><br />
           <label for="Description">Password:</label>
          <input type="password" style="width: 100%;
        padding: 6px;
        border-radius: 3px;
        border: 1px solid #ccc;
        resize: vertical;" name="password" id="password" required /><br /><br />
         <center> <input type="submit" onclick="addData('form1')" value="Login" /></center>
        </form>
      </div>
     <%
     String validUsername = "user"; // Replace with your actual valid username
     String validPassword = "user123"; // Replace with your actual valid password
     
     String username = request.getParameter("username");
     String password = request.getParameter("password");
     
     if (username != null && password != null) {
        if (username.equals(validUsername) && password.equals(validPassword)) {
            
            response.sendRedirect("Home.jsp?msg=login success");
        }
        else
        {
            response.sendRedirect("index.jsp?msg=login Failed");
        }
     }
     
     %>
</body>
</html>