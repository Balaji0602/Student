<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,com.balaji.school.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Delete</title>
</head>
<body>
	<%
	int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
	StudentUtil.deleteStudent(rollNumber);
	%>	
</body>
</html>