<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ko-KR">

	<title>Load Student</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
	<body>
	<div class="container">
		<form action = "student_servlet" method="GET">

			<div class="container p-3 my-3 bg-primary text-white">
				<h2>Update Student</h2>
			</div>
			<input type="hidden" name="command" value="Update" />
			<input type="hidden" name="id" value="${param.id}"/>
					
			<div class="form-group">
		      <label for="fastname">First name : </label>
		      <input type="text" name = "firstName" value ="${student_list.firstName}" class="form-control" id="fastname" placeholder="${student_list.firstName}" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>							
				
			<div class="form-group">
		      <label for="lasname">Last name : </label>
		      <input type="text" name = "lastName" value ="${student_list.lastName}" class="form-control" id="lasname" placeholder="${student_list.lastName}" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>		

			<div class="form-group">
		      <label for="email">Email : </label>
		      <input type="text" name = "eMail" value ="${student_list.eMail}" class="form-control" id="email" placeholder="${student_list.eMail}" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>

			<button type="submit" value = "Update" class="btn btn-primary">Update</button>
			<a href="student_servlet" role="button" class="btn btn-info">Back To List</a>

		</form>			
	</div>
</body>
</html>