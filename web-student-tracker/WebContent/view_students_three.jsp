<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "java.util.*, com.web.jdbc.*" %>

<!DOCTYPE html>

<html>

<head>
	<title>Student Tracker App</title>
	<meta charset="utf-8">
	<!-- 부트스트랩 -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 제이쿼리 -->	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" 
    integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" 
    crossorigin="anonymous"></script>    
    <script src = "js/script.js"></script>
</head>

<body>

<%-- 	<% List<Student> theStudents = (List<Student>)request.getAttribute("student_list");	%> --%>
<%-- 	
	<%= theStudents %>
	<hr>
	<% out.println(theStudents); %>
	<br/><br/> --%>

	<div class="container">
		<div class="container p-3 my-3 bg-primary text-white">
				<h2>Java School</h2> 
		</div>
	</div>
	
	 <div class ="container">
	 <input type="button" class="btn btn-info" value="Add Student" 
			onclick="window.location.href='add-student-form.jsp'; return false;">
	<a href="student_servlet" role="button" class="btn btn-success">Refresh</a>
		
		<table class="table table-hover">
		<tr class="table-info">			
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
							<c:param name = "command" value = "LOAD"/>
							<c:param name = "id" value = "${tempStudent.id}"/>
						</c:url>
						<c:url var = "deleteLink" value="/student_servlet">
							<c:param name = "command" value = "DELETE"/>
							<c:param name = "id" value = "${tempStudent.id}"/>
						</c:url>
					<td><a href = "${tempLink}" class="btn btn-outline-warning">Update</a> 
					& <a href = "${deleteLink}" class="btn btn-outline-danger" onclick="return confirm('Are you sure you want to delete ${tempStudent.firstName} ${tempStudent.lastName} ?');">Delete</a><td>
				</tr>			
			</c:forEach>
		</table>
	</div>
	
</body>

</html>