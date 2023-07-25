<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.time.*,java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Calendar, java.text.SimpleDateFormat" %>
    <%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="IE_heads.jsp">Create/ Modify Heads</a></li>
  <li><a href="ViewReports.jsp">View Reports</a></li>
  <li class="right"><a href="index.jsp">Logout</a></li>
  
</ul>
<br><br>
    <div class="forms">
      <div class="form-container">
          <form id="form1" method="POST" action="income_action.jsp">
          <h2>Daily Income</h2>
          <label for="name1">Income Head</label>
          <select name="incomehead" class="incomehead" id="incomhead" style="width: 104%;padding: 6px;border-radius: 3px;border: 1px solid #ccc;resize: vertical"required>
          <%
          Statement st=null;
        		  ResultSet rs=null;
        		  st=con.createStatement();
        		  rs=st.executeQuery("select * from income_heads");
        		  while(rs.next())
        		  {
          %>
          
          <option  value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
          <%
        		  }
          %>
          </select><br /><br />
          <label for="amount1">Amount:</label>
          <input type="text" name="iamount" id="iamount" required /><br /><br />
           <label for="Description">Description</label>
          <textarea name="idesc"></textarea><br><br>
          <input type="submit" onclick="addData('form1')" value="Submit" />
        </form>
      </div>
      <div class="date">
        <p id="datee">
        <%
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentDate.format(dateFormat);
        out.println(formattedDate);
        %>
        </p>
      </div>

      <div class="form-container">
        <form id="form2" method="POST" action="expense_action.jsp">
          <h2>Daily Expense</h2>
          <label for="name2">Expense Head</label>
          <select name="expensehead" id="expensehead" style="width: 104%;padding: 6px;border-radius: 3px;border: 1px solid #ccc;resize: vertical" required>
          <%
          Statement st1=null;
        		  ResultSet rs1=null;
        		  st1=con.createStatement();
        		  rs1=st1.executeQuery("select * from expense_heads");
        		  while(rs1.next())
        		  {
          %>
          
          <option  value="<%= rs1.getString(1) %>"><%= rs1.getString(2) %></option>
          <%
        		  }
          %>
          </select><br /><br />
          <label for="amount2">Amount:</label>
          <input type="text" name="eamount" id="eamount" required /><br /><br />
          <label for="Description">Description</label>
          <textarea name="edesc"></textarea><br><br>
          <input type="submit" onclick="addData('form2')" value="Submit" />
        </form>
      </div>
    </div>
    <div id="ledger">
    <table>
      <thead>
        <tr>
          <th id="pcb" colspan="4">Petty Cash Book</th>
        </tr>
      </thead>
    </table>
    <table>
      <thead>
        <tr>
          <th width="25%">Date:</th>
          <td width="25%" id="idd"><%
        out.println(formattedDate);
        %></td>
          <td width="25%"></td>
          <td width="25%"></td>
        </tr>
      </thead>
    </table>
    
    <table>
      <thead>
        <tr>
          <td width="25%"></td>
          <td width="25%"></td>
          <th width="25%">Opening balance:</th>
          <td width="25%"><span id="openingBalance"><%
          String timeZone = "UTC"; 
          Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone(timeZone));
          calendar.add(Calendar.DAY_OF_MONTH, -1); // Subtract one day from the current date
          java.util.Date previousDate = calendar.getTime();
          SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
          String previous=outputFormat.format(previousDate);
          //out.println(previous);
          Statement sob=null;
      	  ResultSet rob=null;
      	  double ob=0;
          sob=con.createStatement();
      	  rob=sob.executeQuery("select closing_balance from daily_income where date='"+previous+"';");
      	  while(rob.next())
      	  {
      		  ob=rob.getDouble(1);
      	  }
      	  if(rob==null)
      	  {
      		  ob=0;
      	  }
      	  
          %><%= ob %></span></td>
        </tr>
      </thead>
    </table>
        
    <div class="table-wrapper">
        <!-- First table -->
        <table class="table">
            <tr>
                <th>Income Head</th>
                <th>Amount</th>
            </tr>
            <%
            Statement st2=null;
      	  ResultSet rs2=null;
      	  double totalincome=0;
      	  st2=con.createStatement();
      	  rs2=st2.executeQuery("SELECT i.ihead, SUM(ix.income_amount) AS total_income FROM income_heads i JOIN income ix ON i.id = ix.ihead_id where income_date='"+formattedDate.toString()+"' GROUP BY i.ihead ;");
      	  while(rs2.next())
      	  {
      		  totalincome+=rs2.getDouble(2);
            %>
            <tr>
            <td><%= rs2.getString(1) %></td>
            <td><%= rs2.getString(2) %></td>
            </tr>
            <%
      	  }
            %>
            <tr>
            <td><b>Total Income</b></td>
            <td><%= totalincome %></td>
            </tr>
        </table>
        
        <!-- Second table -->
        <table class="table">
            <tr>
                <th>Expense Head</th>
                <th>Amount</th>
            </tr>
             <%
             Statement st3=null;
       	  ResultSet rs3=null;
       	  double  totalexpense=0;
       	  st3=con.createStatement();
       	  rs3=st3.executeQuery("SELECT e.ehead, SUM(ex.expense_amount) AS total_expense FROM expense_heads e JOIN expense ex ON e.id = ex.ehead_id where expense_date='"+formattedDate.toString()+"' GROUP BY e.ehead;");
       	  while(rs3.next())
      	  {
       		  totalexpense+=rs3.getDouble(2);
            %>
            <tr>
            <td><%= rs3.getString(1) %></td>
            <td><%= rs3.getString(2) %></td>
            </tr>
            <%
      	  }
            %>
            <tr>
            <td><b>Total Expense</b></td>
            <td><%= totalexpense %></td>
            </tr>
        </table>
    </div>
    
    <table>
      <thead>
        <tr>
          <td width="50%"><b>(OB+IncomeTotal)-ExpenseTotal) =>
          <% double cb=(ob+totalincome)-totalexpense; %>
(<%= ob %>+<%= totalincome %>)=(<%= ob+totalincome %>-<%= totalexpense %>)=<%= cb %></b>
          </td>
          <th width="25%">Closing balance:</th>
          <td width="25%"><span id="closingBalance"><%= cb %></span></td>
        </tr>
      </thead>
      <form method="post" action="daily_income.jsp">
     <input type="hidden" value="<%= totalincome %>" name="ti">
     <input type="hidden" value="<%= totalexpense %>" name="te">
     <input type="hidden" value="<%= ob %>" name="ob1">
     <input type="hidden" value="<%= cb %>" name="cb1">
    </table><br>
    <center><input type="submit" value="Submit Daily Report"></center>
    </form>
    </div>
</body>
</html>