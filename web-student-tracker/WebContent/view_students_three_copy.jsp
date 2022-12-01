<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "java.util.*, com.web.jdbc.*" %>

<!DOCTYPE html>

<html>

<head>
	<title>Student Tracker App</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
	
</head>

<body>
	
	<hr>
	<%-- <% List<Student> theStudents = (List<Student>)request.getAttribute("student_list");	%> --%>
<%-- 	
	<%= theStudents %>
	<hr>
	<% out.println(theStudents); %>
	<br/><br/> --%>

	<div id="wrapper">
		<div id="header">
			<h2>Java SchooL</h2> 
		</div>
	</div>
	<br>
	
	
	<input type="button" value="Add Student" 
		onclick="window.location.href='add-student-form.jsp'; return false;"
		class="add-student-button"/> <br>

	
	<div id ="container">
		<div id = "content">
			<table>
			<tr>				
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			
			<%-- <% for(Student tempStudent : theStudents){%>
			<tr>
					<td><%= tempStudent.getFirstName()%></td>
					<td><%= tempStudent.getLastName() %></td>
					<td><%= tempStudent.geteMail() %></td>
				<% } %>	
			</tr> --%>
			
				<c:forEach var= "tempStudent" items = "${student_list}">
					<tr>
						<td>${tempStudent.firstName} </td>
						<td>${tempStudent.lastName} </td>
						<td>${tempStudent.eMail} </td>
							<c:url var = "tempLink" value="/student_servlet">
							<%-- <c:url var = "tempLink" value="Student_servlet"> --%>
								<c:param name = "command" value = "LOAD"/>
								<c:param name = "id" value = "${tempStudent.id}"/>
							</c:url>
						<td><a href = "${tempLink}">Update</a><td>
					</tr>			
				</c:forEach>
			</table>
		</div>
	</div>
	
</body>

</html>