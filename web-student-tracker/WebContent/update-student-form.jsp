<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Load Student</title>
</head>
<body>

	<form action = "student_servlet" method="GET">
	<input type="hidden" name="command" value="Update" />
	<input type="hidden" name=id value = "${param.id}"/>
	<h2>Update Student</h2>
		<table>
			<tbody>
				<tr>					
			       	<td><label>First name : </label><td/>
			       	<td><input type ="text" name = "firstName" value ="${student_list.firstName}"/></td>
				</tr>
				<tr>
		        	<td><label>Last name : </label><td/>
			       	<td><input type ="text" name = "lastName" value ="${student_list.lastName}"/></td>
			 	</tr>
				<tr>
		        	<td><label>Email : </label><td/>
			       	<td><input type ="text" name = "eMail" value ="${student_list.eMail}"/> </td>
				</tr>
			    <tr>
		        	<td><label></label><td/>
			       	<td><input type = "submit" value = "Update" class="add-student-button"/></td>
			   </tr>
		   </tbody>
		</table>
		<br>
		
	</form>
	
	<a href="student_servlet">Back To List</a>

</body>
</html>