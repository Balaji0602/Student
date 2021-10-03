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
				int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
				String name = request.getParameter("name");
				String standard = request.getParameter("standard");
				String section = request.getParameter("section");

				Student student = new Student();

				student.setName(name);
				student.setStandard(standard);
				student.setSection(section);
				student.setRollNumber(rollNumber);

				StudentUtil.updateStudent(student);
			%>
			<script type="text/javascript">
				window.location.href = "./../View/viewStudents.jsp";
				alert('Your Details Updated Sucessfully');			
			</script>
</body>
</html>