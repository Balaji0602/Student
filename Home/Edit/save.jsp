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
				String name = request.getParameter("name");
				String standard = request.getParameter("standard");
				String section = request.getParameter("section");

				Records student = new Records();

				student.setName(name);
				student.setStandard(standard);
				student.setSection(section);
				student.setRollNumber(rollNumber);

				SchoolRecord.editRecord(student);
			%>
			<script type="text/javascript">
				window.location.href = "./../details/details.jsp?";	
			</script>
</body>
</html>