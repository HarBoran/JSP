<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>

<body>
<%-- Here is the jsp comment --%>
<!-- Here is the html comment -->

<c:set var="data" value="Singapore,Toyko,Munbai,London"/>

<h2>N0.1</h2>
<c:forEach var= "test" items = "${data}">
	${test}<br/>
</c:forEach>

<br/>

<h2>First Demo</h2>

<c:set var ="FirstDemo" value = "${fn:split(data,',')}"/>

<c:forEach var="i" items = "${FirstDemo}">
	${i} <br/>
</c:forEach>


<h2>Second Demo</h2>
Result of joining : ${fn:replace(data,",","*")}

 <br/> <br/>

<c:set var="j" value ="${fn:join(FirstDemo,'*')}"/>
Result of joining2 : ${j}

</body>
</html>