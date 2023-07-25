<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*,java.text.SimpleDateFormat, java.text.DateFormat, java.util.Date" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pretty Cash Book</title>
</head>
<body>
<%
Statement st=null;
String income_id=request.getParameter("incomehead");
String income_amount=request.getParameter("iamount");
String income_desc=request.getParameter("idesc");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
Date date = new Date();
String idate=dateFormat.format(date);
st=con.createStatement();
int i=st.executeUpdate("insert into income(income_amount, income_date, income_description, ihead_id) values('"+income_amount+"','"+idate+"','"+income_desc+"','"+income_id+"')");
if(i>0)
{
	response.sendRedirect("Home.jsp?Income=Success");
}
else
{
	response.sendRedirect("Home.jsp?Income=Failed");
}
%>
</body>
</html>