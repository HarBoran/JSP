<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>

<c:forEach var= "list" items = "${student_list}">
	${list}<br/>
</c:forEach>

</body>
</html>