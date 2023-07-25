<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.text.SimpleDateFormat, java.time.*" %>
    <%@ include file="connect.jsp" %>
    <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Weekly Report</title>
<link rel="stylesheet" href="style.css"/>
<style>
.table-wrapper {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        /* Style for each individual table */
        .table {
            border: 1px solid black;
            border-collapse: collapse;
            width: 50%; /* Adjust the width as needed */
        }
        
        /* Style for table headers */
        .table th {
            background-color: #ffff;
            border: 1px solid black;
            padding: 8px;
        }
        
        /* Style for table cells */
        .table td {
            border: 1px solid black;
            padding: 8px;
        }
        body
        {
        margin: 0;
        }
        
        
ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #04AA6D;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}
    </style>
</head>
<body>
<h1>Petty Cash Book</h1>
<ul class="topnav">
  <li><a href="Home.jsp">Home</a></li>
  <li><a  href="IE_heads.jsp">Create/ Modify Heads</a></li>
  <li><a class="active" href="ViewReports.jsp">View Reports</a></li>
  <li class="right"><a href="index.jsp">Logout</a></li>
  
</ul>
<br><br>
<center>
<h1>Weekly Income Report</h1><br><br>
<div class="table-wrapper" align="center">
        <!-- First table -->
        <center>
        <table class="table">
            <tr>
                <th>Date</th>
                <th>Total Income</th>
                <th>Total Expense</th>
                <th>Opening Balance</th>
                <th>Closing Balance</th>
            </tr>
<%
Date today = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
String todayDate = sdf.format(today);

// Get last week's date
Calendar calendar = Calendar.getInstance();
calendar.add(Calendar.WEEK_OF_YEAR, -1);
Date lastWeekDate = calendar.getTime();
String lastWeekDateString = sdf.format(lastWeekDate);
Statement st=null;
ResultSet rs=null;
double ti=0;
double te=0;
double ob=0;
double cb=0;
st=con.createStatement();
rs=st.executeQuery("select * from daily_income where date between '"+lastWeekDateString+"' and '"+todayDate+"' ;");
while(rs.next())
{
	
	ti+=rs.getDouble("total_income");
	
	te+=rs.getDouble("total_expense");
	
	ob+=rs.getDouble("opening_balance");
	
	cb+=rs.getDouble("closing_balance");
%>
            <tr>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("total_income") %></td>
            <td><%= rs.getString("total_expense") %></td>
            <td><%= rs.getString("opening_balance") %></td>
            <td><%= rs.getString("closing_balance") %></td>
            </tr>
            <%
      	  }
            %>
            <tr>
            <td><b>Total</b></td>
            <td><%= ti %></td>
            <td><%= te %></td>
            <td><%= ob %></td>
            <td><%= cb %></td>
            </tr>
        </table>
        </center><br><br>
        <a style="align-content: center" href="ViewReports.jsp">Back</a>
        
</body>
</html>