<%@ page import = "com.jstlEx.jsp.tagdemo.Student" %>
<%@ page import = "java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	//배열을 만듬
	/* List<Student> student = new ArrayList<>();

	Student student2 = new Student("John","Doe",false);
	Student student3 = new Student("MaxWell","Johnson",false);
	
	student.add(student2);
	student.add(student3);
	student.add(new Student("Marry","Public",true)) */;
	
	Student[] student = new Student[3];
	student[0] = new Student("John","Doe",false);
	student[1] = new Student("MaxWell","Johnson",false);
	student[2] = new Student("Marry","Public",true);
	
	
	/* Student[] student = {(new Student("John","Doe",false)),
			(new Student("MaxWell","Johnson",false)),
			(new Student("Marry","Public",true))};  */
	
	//이페이에 있는 속성들을("이름으로", 이값들을 저장함)
	pageContext.setAttribute("mystudent",student);
	
%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<c:forEach var="Student" items = "${mystudent}">
	${Student.firstName} ${Student.getLastName()} ${Student.isGoldCustomer()} </br>
</c:forEach>


	<table border = "2">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Gold Customer</th>
		<th>jstl core : if ,choose</th>
		
	</tr>
	
	<c:forEach var="Student" items = "${mystudent}">
		
		<tr>
			<td>${Student.firstName} </td>
			<td>${Student.getLastName()} </td>
			<td><c:if test="${Student.isGoldCustomer()}">
					Special Discount
				</c:if>
				<c:if test="${!Student.isGoldCustomer()}">
					No offer
				</c:if>
			</td>
			<td>
				<c:choose>
					<c:when test = "${'Marry' eq Student.firstName}">
						First Name is Marry
					</c:when>
					
					<c:otherwise>
						NoNoNo
					</c:otherwise>
				</c:choose>
			</td>
		</tr>

	</c:forEach>
	</table>
 
</body>
</html>