
<!DOCTYPE html>
<html>
<head>

<title>Confirmation</title>
</head>

<%
	String list = request.getParameter("list");
	Cookie cookie = new Cookie("cookie", list);
	//cookie.setMaxAge(60*60);
	response.addCookie(cookie);
	
	out.println(request.getParameter("list"));
	out.println(list);
	
%>
<body>

Thank!
<br/><br/>

<a href = "cookies.jsp">Return to homepage.</a>

</body>
</html>