<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Reports</title>
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
Select Report Type: <select id="option">
<option>Select Option</option>
<option value="Daily">Daily</option>
<option value="Weekly">Weekly</option>
<option value="Monthly">Monthly</option>
<option value="Quarterly">Quarterly</option>
<option value="Yearly">Yearly</option>
</select>
<div id="content-container">
        <!-- The content will change based on the selected option -->
        <div id="option1-content" style="display: none;">
<center>
<form >
Date: <input type="date" name="date"><br><br>
<input type="submit" value="Get Report">
</form>
</center>
</div>
        <div id="option2-content" style="display: none;">
        <form method="post" action="WeeklyReport.jsp">
        <br><br><input type="submit" value="Get Report">
        </form>
        </div>
        <div id="option3-content" style="display: none;">
        
        </div>
        <div id="option4-content" style="display: none;">
        
        </div>
    </div>
    <script type="text/javascript">
 // script.js
    document.addEventListener("DOMContentLoaded", function() {
        // Get references to the elements
        const dropdown = document.getElementById("option");
        const option1Content = document.getElementById("option1-content");
        const option2Content = document.getElementById("option2-content");
        const option3Content = document.getElementById("option3-content");
        const option4Content = document.getElementById("option4-content");
        // Add event listener to the dropdown
        dropdown.addEventListener("change", function() {
            // Get the selected option value
            const selectedOption = dropdown.value;

            // Hide all content first
            option1Content.style.display = "none";
            option2Content.style.display = "none";
            option3Content.style.display = "none";
            option4Content.style.display = "none";

            // Show the content for the selected option
            if (selectedOption === "Daily") {
                option1Content.style.display = "block";
            } else if (selectedOption === "Weekly") {
                option2Content.style.display = "block";
            } else if (selectedOption === "option3") {
                option3Content.style.display = "block";
            }
            else if (selectedOption === "option4") {
                option4Content.style.display = "block";
            }
        });
    });
</script>
</body>
</html>