<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note : Notes Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>Please fill your note details.</h2>
		<form action="AddServlet" method="post" class="py-3">
			<div class="form-group">
				<label for="title">Title: </label>
				 <input	type="text" class="form-control" name="title" placeholder="Enter your title here.." required/> 
			</div>
			<div class="form-group">
				<label for="content">Content: </label>
				 <textarea class="form-control" name="content" placeholder="Enter your content here.." required style="height: 300px;"></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success">Add</button>
			</div>
		</form>

	</div>

</body>
</html>