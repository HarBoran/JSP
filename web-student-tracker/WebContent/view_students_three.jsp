<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import= "java.util.*, com.web.jdbc.*" %>

<!DOCTYPE html>

<html>

<head>
	<title>Student Tracker App</title>
	<meta charset="utf-8">
	<!-- 부트스트랩 -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 제이쿼리 -->	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" 
    integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" 
    crossorigin="anonymous"></script>    
    <script src = "js/script.js"></script>
    
    <script>
	    $(document).ready(function(){
	        $("#test").click(function(){
	        	var b =$("#map");
	        	b.animate({right: '100px'});
	        	b.animate({right: '-100px'});
	        	b.animate({right: '200px'});
	        	b.animate({right: '-200px'});
	        	b.animate({left : '200px', right: '200px'});
 	        	$("body").animate({right: '200px', left : '200px'});
	            $("body").animate({width: '70%', left: '500px'});
	            $("body").animate({width: '120%', height :'80%' });
	            $("body").animate({width: '100%', height : '120%'});
	            $("body").animate({left: '-200px', bottom : '-200px'});
	            $("body").animate({right: '-200px', top : '-200px'});
	            $("body").animate({left: '0px', top : '0px'});
	        });
	    });
    </script>

    
    <script>
    //student 뷰단
    //<a href = "${deleteLink}" class="deletelink">
	    $(document).ready(function(){
			$(".deletelink").click(function(){
				if(confirm("Data will be delete")){
					var ggg = $("#qwer").html();
	                alert(ggg);
	                //alert("Delating");
	            }else{
	                return false;
	            }
			});
		});
    </script>
    
</head>

<body style = "position:relative">

<%-- 	<% List<Student> theStudents = (List<Student>)request.getAttribute("student_list");	%> --%>
<%-- 	
	<%= theStudents %>
	<hr>
	<% out.println(theStudents); %>
	<br/><br/> --%>

	<div class="container">
		<div class="container p-3 my-3 bg-primary text-white">
				<h2>Java School</h2> 
		</div>
	</div>
	
	 <div class ="container">
	 <input type="button" class="btn btn-info" value="Add Student" 
			onclick="window.location.href='add-student-form.jsp'; return false;">
	<a href="student_servlet" class="btn btn-success" sylte ="position : relative">Refresh</a>
	<input type = button value = jQuery id = test>
		<table class="table table-hover">
		<tr class="table-info">			
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Action</th>
		</tr>
		
		<%-- <% for(Student tempStudent : theStudents){%>
		<tr>
				<td><%= tempStudent.getFirstName()%></td>
				<td><%= tempStudent.getLastName() %></td>
				<td><%= tempStudent.geteMail() %></td>
			<% } %>	
		</tr> --%>
		
			<c:forEach var= "tempStudent" items = "${student_list}">
				<tr>
					<td id = "qwer">${tempStudent.firstName} </td>
					<td>${tempStudent.lastName} </td>
					<td>${tempStudent.eMail} </td>
						<c:url var = "tempLink" value="/student_servlet">
							<c:param name = "command" value = "LOAD"/>
							<c:param name = "id" value = "${tempStudent.id}"/>
						</c:url>
						<c:url var = "deleteLink" value="/student_servlet">
							<c:param name = "command" value = "DELETE"/>
							<c:param name = "id" value = "${tempStudent.id}"/>
						</c:url>
					<td><a href = "${tempLink}" class="btn btn-outline-warning">Update</a> 
					& <a href = "${deleteLink}" class="deletelink">Delete</a><td>
					<%-- & <a href = "${deleteLink}" class="btn btn-outline-danger" id ="deletelink">Delete</a><td> --%>
						<%-- onclick="return confirm('Are you sure you want to delete ${tempStudent.firstName} ${tempStudent.lastName} ?');">Delete</a><td> --%>
				</tr>			
			</c:forEach>
		</table>
	</div>
	<hr><hr><hr>
	
	<div id="map" style="width:500px;height:400px;left:200px"></div>
	<% String appkey;%>
	<% appkey = "09435e8a15e006b36a9a83d98131dd0f"; %>
	<% %>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09435e8a15e006b36a9a83d98131dd0f"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.570993000203984 , 126.99251768639506 ), // 지도의 중심좌표
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
	

</body>

</html>