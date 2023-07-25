<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ehead=request.getParameter("ehead");
String edesc=request.getParameter("edesc");
String sqlQuery = "SELECT COUNT(*) FROM expense_heads WHERE ehead = ?";
PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
preparedStatement.setString(1, ehead);
ResultSet resultSet = preparedStatement.executeQuery();

// Check if the value exists
boolean exists = false;
if (resultSet.next()) {
    int count = resultSet.getInt(1);
    if (count > 0) {
        exists = true;
    }
}
if(!exists)
{
	Statement st=con.createStatement();
	int i=st.executeUpdate("insert into expense_heads(ehead,edesc) values('"+ehead+"','"+edesc+"');");
	if(i>0)
	{
		response.sendRedirect("IE_heads.jsp?msg=Expense added");
	}
	else
	{
		response.sendRedirect("IE_heads.jsp?msg=Failed to add Expense");
	}
}
if(exists)
{
	response.sendRedirect("IE_heads.jsp?msg=Already exists");
}
%>
</body>
</html>