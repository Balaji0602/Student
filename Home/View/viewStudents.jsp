<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*,com.balaji.school.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Student Details</title>
	<script src="https://kit.fontawesome.com/a50c5d99bb.js" crossorigin="anonymous"></script>
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Acme&family=Architects+Daughter&family=Yanone+Kaffeesatz:wght@500&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap');

		body{
			background-image: url(tablebgimg.jpg);
			background-attachment: fixed;
			background-position: center;
			background-size: cover;
			box-sizing: border-box;
		}
		table{
			left: 13%;
			position: absolute;
			background-color: whitesmoke;
			justify-content: center;
			align-items: center;
			color: #000;
			width: 75%;
			border-collapse: collapse;
			border: 1px solid #B0ADAA;
		}
		h1,h2{
			text-align: center;
			font-family: 'Acme', sans-serif;

		}
		tr,td{
			padding: 15px;
  			text-align: left;
			font-family: 'Crimson Text', serif;	
		}
		.heading{
			color: white;
			background-color: #4C22E8;
		}
		tr:hover{
			background-color: #A3C0EE;
			width: 80%;
		}
		.backHome {
			width: 20px;
			height: 25px;
			left: 85%;
			top: 14%;
			position: absolute;
		}
		.backHome button{
			width: 47px;
			height: 37px;
			border: none;
			outline: none;
			border-radius: 25px;
			background-color: #4C22E8;
			color: white;
		}
		.backHome button:hover{
			cursor: pointer;
			background-color: #F5392F;
		}
		.fas:hover{
			cursor: pointer;
		}
		.delbutton button:hover{
			background-color:#F5392F ;
		}
	</style>
</head>
<body>
	<h1>ABCD Higher Secondary School</h1>
	<h2>Students Details</h2>
	<div class="backHome">
	<button class="fas fa-home" name="backhome" onclick="back();"></button>
	</div>
	<table border="1">
		<tr id="tbltop" class="heading">
			<td><h3>Roll Number</h3></td>
			<td><h3>Name</h3></td>
			<td><h3>Standard</h3></td>
			<td><h3>Section</h3></td>
			<td><h3>Edit</h3></td>
			<td><h3>Delete</h3></td>
		</tr>
	<%
	List<Student> students = StudentUtil.viewStudents();

	for (int i=0;i<students.size();i++) {

		Student student = students.get(i);

		String rowId = "row" + i;
	%>

		<tr id= "<%=rowId%>">
			<td><%=student.getRollNumber()%></td>
			<td><%=student.getName()%></td>
			<td><%=student.getStandard()%></td>
			<td><%=student.getSection()%></td>
			<td><button class="fas fa-user-edit" onclick="editbtn('<%=rowId%>');"></button></td>
			<div class="delbutton">
			<td><button class="fas fa-user-minus" onclick="userdel('<%=rowId%>');"></button></td>
			</div>
		</tr>
	<%
	}
	%>	
	</table>
	<script type="text/javascript">
		function userdel(getDelRno) {
			var Delete = document.getElementById(getDelRno).getElementsByTagName("td");
			var rollNumber = Delete[0].innerText;
			if (confirm('Are You Sure You Want to Delete Your Record')) {
			window.location.href="./../Edit/delete.jsp?rollNumber=" + rollNumber;
			alert('Record Deleted Sucessfully');
			window.location.href = "./../View/viewStudents.jsp?";
			}
			else{
				alert('Record Not Deleted');
			}
		}
		function editbtn(getEditRno) {
			var editUser = document.getElementById(getEditRno).getElementsByTagName("td");
			var rollNumber = editUser[0].innerText;
			var name = editUser[1].innerText;
			var standard = editUser[2].innerText;
			var section = editUser[3].innerText;
			window.location.href = "./../Edit/editPage.jsp?rollNumber=" + rollNumber + "&name=" + name + "&standard=" + standard + "&section=" + section;
		}
		function back() {
			// body...
			window.location.href = "./../schoolHome.html";
		}
	</script>
</body>
</html>