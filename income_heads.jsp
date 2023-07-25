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
String ihead=request.getParameter("ihead");
String idesc=request.getParameter("idesc");
String sqlQuery = "SELECT COUNT(*) FROM income_heads WHERE ihead = ?";
PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
preparedStatement.setString(1, ihead);
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
	int i=st.executeUpdate("insert into income_heads(ihead,idesc) values('"+ihead+"','"+idesc+"');");
	if(i>0)
	{
		response.sendRedirect("IE_heads.jsp?msg=Income added");
	}
	else
	{
		response.sendRedirect("IE_heads.jsp?msg=Failed to add Income");
	}
}
if(exists)
{
	response.sendRedirect("IE_heads.jsp?msg=Already exists");
}
%>
</body>
</html>