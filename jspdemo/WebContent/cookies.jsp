<html>
<head>
<title>Cookies</title>

</head>

<body>
<h2>Training Portal</h2>

<% 
	String list = "Java";

	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(Cookie c : cookies){
		//out.print(c + c.getName() + c.getValue()+ "<br/>");
			if("cookie".equals(c.getName())){
				list = c.getValue();
				break;
			}
		}
	}
		
	 for(int i=0; i < cookies.length; i++){
		out.println("i = " + i + " Name = " +cookies[i].getName() +" Value = "+ cookies[i].getValue() + "</br>");
	}
		 

%>
<h3>NEW Books for <%= list %></h3>
	<ul>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	</ul>

<h3>Latest New Reports for <%= list %></h3>
	<ul>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	</ul>
	
<h3>Hot Job for <%= list %></h3>
	<ul>
	<li>blah blah blah</li>
	<li>blah blah blah</li>
	</ul>	
	
<a href="cookies2.jsp">Personalize this page</a>	


</body>
</html>