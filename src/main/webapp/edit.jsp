<%@page import="com.notes.entities.Notes"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.notes.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
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
		<%
		int note_id = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getConnection().openSession(); 
		Notes n = s.get(Notes.class, note_id);  
		%>
		<br>
		<h2>Edit notes details.</h2>
		<form action="EditServlet" method="post" class="py-3">
		<input type="hidden" name="note_id" value="<%=n.getId()%>"/>
			<div class="form-group">
				<label for="title">Title: </label> <input type="text"
					class="form-control" name="title"
					placeholder="Enter your title here.." value="<%=n.getTitle()%>" required />
			</div>
			<div class="form-group">
				<label for="content">Content: </label>
				<textarea class="form-control" name="content"
					placeholder="Enter your content here.." required
					style="height: 300px;"><%=n.getContent() %></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>

	</div>

</body>
</html>