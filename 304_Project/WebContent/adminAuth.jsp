<!-- ZACH







ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("admin") != null) {
		boolean authenticated = ((Boolean) session.getAttribute("admin")).booleanValue();
		if (authenticated != true) {
			out.println("You have not been authorized to access this page! Redirecting back to home page...");
%>
<script>
	setTimeout("document.location.href='homepage.jsp'", 4000);
</script>
<%
	return;
		}
	} else {
		out.println("You have not been authorized to access this page! Redirecting back to home page...");
%>
<script>
	setTimeout("document.location.href='homepage.jsp'", 4000);
</script>
<%
	return;
	}
%>