<%@ page import = "java.util.*" %>

<html>
<head>
<title>ToDo Demo</title>
</head>

<body>

<form action = "Todo-demo.jsp">
	Add new item : 
	<input type = "text" name = "item"/>
	<input type = "submit" value = "Submit"/>
</form>

	<hr>
 <h2>To List Items : </h2>
 <b>To List Items : </b>
 
<%
	List<String> todo= (List<String>) session.getAttribute("todo123456");
	if(todo == null){
		todo = new ArrayList<String>();
		session.setAttribute("todo123456", todo);
	} 
	
	
	String item = request.getParameter("item");
	//!item.trim().equals("")
 	if((item != null) && (item.trim().length() > 0) && (!todo.contains(item))){
 		
 		todo.add(item.trim());
 		
	}
 	
%>

	<ol><%
		for(String s : todo){
			out.println("<li>" + s + "</li>");
		}
	%></ol>

</body>
</html>