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
		String name = request.getParameter("name");
		String standard = request.getParameter("standard");
		String section = request.getParameter("section");

		Records student = new Records();

		student.setName(name);
		student.setStandard(standard);
		student.setSection(section);

		SchoolRecord.insertRecord(student);
	%>
	<script type="text/javascript">
		alert('Registered Sucessfully');
	</script>
</body>
</html>