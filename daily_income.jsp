<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*,java.util.*,java.text.SimpleDateFormat, java.text.DateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String totalincome=request.getParameter("ti");
String totalexpense=request.getParameter("te");
String ob=request.getParameter("ob1");
String cb=request.getParameter("cb1");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
Date date = new Date();
String idate=dateFormat.format(date);
Statement st=null;
st=con.createStatement();
int i=st.executeUpdate("insert into daily_income( total_income, total_expense, closing_balance, opening_balance, date) values('"+totalincome+"','"+totalexpense+"','"+cb+"','"+ob+"','"+idate+"');");
if(i>0)
{
	response.sendRedirect("Home.jsp?Daily_Income=Success");
}
else
{
	response.sendRedirect("Home.jsp?Daily_Income=Failed");
}
%>
</body>
</html>