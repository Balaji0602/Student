<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,com.school.p1.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<%
	int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
	SchoolRecord.DeleteRecord(rollNumber);
	%>	
</body>
</html>