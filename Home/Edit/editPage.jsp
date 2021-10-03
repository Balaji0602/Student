<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,com.school.p1.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Edit Your Details</title>
	<link rel="stylesheet" type="text/css" href="editPage.css">
	<script src="https://kit.fontawesome.com/a50c5d99bb.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="studetail">
		<%
			int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
			String name = request.getParameter("name");
			String standard =request.getParameter("standard");
			String section = request.getParameter("section");

		%>
	</div>
		<div class="editer">
			<form name="editform" action="studentUpdate.jsp" method="POST">
				<h2>Edit Your Details</h2>
				<h3>Roll Number : <%=rollNumber%></h3>
				<input type="hidden" name="rollNumber" value="<%=rollNumber%>">
				<p>Name</p>				
				<input type="text" id="name" name="name" value="<%=name%>" placeholder="Enter your Name"><br>
				<p>Standard</p>
				<input type="text" id="standard" name="standard" value="<%=standard%>" placeholder="Enter your Standard"><br>
				<p>Section</p>
				<input type="text" id="section"  name="section" value="<%=section%>" placeholder="Enter your Section"> 
				<br>
				<br>
				<br>
				<input type="button" value="Update" onclick="formValidation();">
				<input type="button" value="Back" onclick="back();">
			</form>
		</div>
		<script type="text/javascript">
		function formValidation() {
			var editform= document.editform;
			var rollNumber = <%=rollNumber%>;
			var name = editform.name.value;
			var standard = editform.standard.value;
			var section = editform.section.value;

			if (name  == ""){
				alert('Please Enter your Name');
			}
			else if (standard  == ""){
				alert('Please Enter your Standard');
			} 
			else if (section  == ""){
				alert('Please Enter your Section');
			}
			else{
				if (confirm("Are your sure You want to Edit Your Details")) {
					editform.submit();
				}	
			}
		}
		function back() {
			window.location.href = "./../View/viewStudents.jsp";
		}
	</script>
</body>
</html>