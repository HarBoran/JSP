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
	                alert("Delating");
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
					<td>${tempStudent.firstName} </td>
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
		
		<div id="map" style="width:750px;height:350px;"></div>
		
		<p style="margin-top:-12px">
	    <em class="link">
	        <a href="/web/documentation/#MapTypeId" target="_blank">지도 타입을 보시려면 여기를 클릭하세요!</a>
	    </em>
	</p>
	<div id="map" style="width:100%;height:350px;"></div>
	<p>개발자도구를 통해 직접 확인해 보세요.</p>
	    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09435e8a15e006b36a9a83d98131dd0f"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.570993000203984 , 126.99251768639506 ), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	/*
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도 타입 컨트롤을 지도에 표시합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	function getInfo() {
	    // 지도의 현재 중심좌표를 얻어옵니다 
	    var center = map.getCenter(); 
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    // 지도타입을 얻어옵니다
	    var mapTypeId = map.getMapTypeId(); 
	    
	    // 지도의 현재 영역을 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역의 남서쪽 좌표를 얻어옵니다 
	    var swLatLng = bounds.getSouthWest(); 
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    var neLatLng = bounds.getNorthEast(); 
	    
	    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	    var boundsStr = bounds.toString();
	    
	    
	    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
	    message += '경도 ' + center.getLng() + ' 이고 <br>';
	    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
	    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
	    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
	    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
	    
	    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
	    // ex) console.log(message); 
	} */
	</script>
	
	
</body>

</html>