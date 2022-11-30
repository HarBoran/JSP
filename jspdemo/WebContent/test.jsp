<html>
<h1 align="center">JSP Tutorial</h1>
<h2 align="center">JSP Tutorial</h2>
<h3 align="center">JSP Tutorial</h3>
<h4 align="center">JSP Tutorial</h4>


<body>
	<jsp:include page="myheader.html"/>
	It's a blessed day....
	</br>
	</br> It's a blessed day....
	</br>
	</br> It's a blessed day....
	</br>
	</br>

	<jsp:include page="my-footer.jsp" />
	
</body>

<footer>
	<p align="center">
		Last updated :
		<%=new java.util.Date()%>
	</p>


</footer>

</html>