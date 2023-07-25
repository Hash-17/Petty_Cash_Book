<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*,java.util.*,java.text.SimpleDateFormat, java.text.DateFormat, java.util.Date" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Statement st=null;
String expense_id=request.getParameter("expensehead");
String expense_amount=request.getParameter("eamount");
String expense_desc=request.getParameter("edesc");
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
Date date = new Date();
String edate=dateFormat.format(date);
st=con.createStatement();
int i=st.executeUpdate("insert into expense(expense_amount, expense_date, expense_description, ehead_id) values('"+expense_amount+"','"+edate+"','"+expense_desc+"','"+expense_id+"')");
if(i>0)
{
	response.sendRedirect("Home.jsp?Expense=Success");
}
else
{
	response.sendRedirect("Home.jsp?Expense=Failed");
}
%>
</body>
</html>