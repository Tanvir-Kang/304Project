<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Object authUser = session.getAttribute("authenticatedUser");
	boolean authenticated = authUser == null ? false : true;
	if (!authenticated) {
		out.println("You have not been authorized to access this page! Redirecting back to home page...");
%>
<script>
	setTimeout("document.location.href='homepage.jsp'", 4000);
</script>
<%
		return;
	}
%>