 <html>
<head>
<title>Student Confirmation Title</title>
</head>
<body>

	The student is confirmed:
	<%= request.getParameter("firstName") %>
	<%= request.getParameter("lastName") %>
	<br />
	The student is confirmed: 
	${param.firstName} ${param.lastName}
	<br />
	Favorite Programing Language:
	<%= request.getParameter("language") %>
	<br />
	
	Check Box:
	<ul>
	<% 
	
	String[] langs = request.getParameterValues("Programinglanguage");
	if(langs != null){
		for(String t : langs){
			out.println("<li>" + t +"</li>" );
		}
		for(int i = 0; i <langs.length; i++){
			out.println("<li>" + langs[i] +"</li>" );
		}
	}else{
		out.println("NullpointerException");
	}

	%>
	</ul>
	
	<br />
	The student's country:
	<%= request.getParameter("country") %>
	${param.country}

	<br />
	<br />

</body>
</html>