	<!-- jar파일 붙여 놓음 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	//배열을 만듬
	String[] cities = {"Mumbai", "Singapore", "Philadelphia"};
	//이페이에 있는 속성들을("이름으로", 이값들을 저장함)
	pageContext.setAttribute("myCities",cities);
	
%>
<br/>
<html>
<body>
	
	<c:forEach var="tempCity" items = "${myCities}">
	
	${tempCity} <br/>
	
	</c:forEach>

</body>

</html>