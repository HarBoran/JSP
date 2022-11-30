<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 변수선언 -->
<c:set var="theLocale"
	value="${not empty param.theLocale 
		? param.theLocale : pageContext.request.locale}"
	scope="session" />
<%-- {2>1 ? true : false } --%>

<fmt:setLocale value="${theLocale}" />
<fmt:setBundle basename="com.jstlEx.jsp.tagdemo.i18n.resources.mylabels" />
<html>
<body>
	${pageContext.request.locale}
	<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a>|
	<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a>|
	<a href="i18n-messages-test.jsp?theLocale=de_DE">German (DE)</a>

	<hr>
	<fmt:message key="label.greeting" />
	<br />
	<br />
	<fmt:message key="label.firstname" />
	<i>John</i>
	<br />
	<fmt:message key="labal.lastname" />
	<i>Doe</i>
	<br />
	<br />
	<fmt:message key="label.welcome" />
	<br />
	<hr>

	Selected locale: ${theLocale}
	</br>

</body>
</html>