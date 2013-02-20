<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*" %>

<%
	String id="administrator";
	session.setAttribute("loginid",id);
	response.sendRedirect("/connect.jsp");
%>