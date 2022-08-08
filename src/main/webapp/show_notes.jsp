<%@page import="org.hibernate.Query"%>
<%@page import="com.notes.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="com.notes.helper.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes Here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>All Notes</h1>
		<div class="row">
			<div class="col-12">
				<%
				try {
					Session s = FactoryProvider.getConnection().openSession();
					Query q = s.createQuery("from Notes");
					List<Notes> list = q.list();
					for (Notes n : list) {
				%>
				<div class="card mt-4">
					<img src="img/note.png" class="card-img-top pt-3 pl-3 img-fluid" alt="" style="max-width:150px;">
					<div class="card-body">
						<h5 class="card-title"><%=n.getTitle()%></h5>
						<p class="card-text"><%=n.getContent() %></p>
						<p class="card-text text-primary"><%=n.getAddedDate() %></p>
						<div class="text-center">
						<a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
					    <a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
					    </div>
					</div>
				</div>

				<% 
				}
				s.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</div>
		</div>
	</div>

</body>
</html>