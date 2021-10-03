<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,com.balaji.school.*" %>

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

		Student student = new Student();

		student.setName(name);
		student.setStandard(standard);
		student.setSection(section);

		StudentUtil.createStudent(student);
	%>
	<script type="text/javascript">
		window.location.href = "registerPage.html"
		alert('Registered Sucessfully');
	</script>
</body>
</html>