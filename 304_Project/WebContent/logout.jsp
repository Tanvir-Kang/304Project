<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session.removeAttribute("authenticatedUser");
response.sendRedirect("login.jsp");
session = request.getSession(true);
session.setAttribute("logoutMessage", "Successfully logged out!");
%>