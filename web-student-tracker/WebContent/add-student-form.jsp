<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ko-KR">
<title>Add Student</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="container p-3 my-3 bg-primary text-white">
			<h2>Add Student</h2>
		</div>		
		<form action = "student_servlet" method="GET" class="was-validated">
			<input type="hidden" name="command" value="ADD" />
				
			<div class="form-group">
		      <label for="fastname">First name :</label>
		      <input type="text" class="form-control" id="fastname" placeholder="Enter FirstName" name="firstName" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    
		    <div class="form-group">
		      <label for="lastname">Last name :</label>
		      <input type="text" class="form-control" id="lastname" placeholder="Enter LastName" name="lastName" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>
		    
		    <div class="form-group">
		      <label for="email">Email :</label>
		      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="eMail" required>
		      <div class="valid-feedback">Valid.</div>
		      <div class="invalid-feedback">Please fill out this field.</div>
		    </div>

			<button type="submit" value = "Save" class="btn btn-primary">Save</button>
			<a href="student_servlet" class="btn btn-info" role="button">Back To List</a>
			
		</form>		
	</div>
</body>
</html>