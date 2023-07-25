<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create/Modify Heads</title>

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
  <li><a class="active" href="IE_heads.jsp">Create/ Modify Heads</a></li>
  <li><a href="ViewReports.jsp">View Reports</a></li>
  <li class="right"><a href="index.jsp">Logout</a></li>
  
</ul>
<br><br>
    <div class="forms">
      <div class="form-container">
          <form id="form1" method="POST" action="income_heads.jsp">
          <h2>Income Head</h2>
          <label for="amount1">New Income Head:</label>
          <input type="text" name="ihead" id="ihead" required /><br /><br />
           <label for="Description">Description</label>
          <textarea name="idesc"></textarea><br><br>
          <input type="submit" value="Submit" />
        </form>
      </div>
      <div class="date">
        <p id="datee">
        </p><br>
        </div>
      <div class="form-container">
        <form id="form2" method="POST" action="expense_heads.jsp">
          <h2>Expense Heads</h2>
          <label for="amount2">New Expense Head:</label>
          <input type="text" name="ehead" id="ehead" required /><br /><br />
          <label for="Description">Description</label>
          <textarea name="edesc"></textarea><br><br>
          <input type="submit" value="Submit" />
        </form>
      </div>
    </div>
</body>
</html>