<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
	<head>
		<title>c:param JSTL core tag example</title>
	</head>
	<body>
		<c:url var = "helloUrl" value="/hello.jsp">
			<c:param name = "userName" value = "PSY"></c:param>
			<c:param name = "userId" value = "3"></c:param>
		</c:url>
	<h4><a href = "${helloUrl}">Click here</a></h4>
	
	</body>
</html>