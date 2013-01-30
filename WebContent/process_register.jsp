<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.*,javax.sql.*"%>
<%@page import="org.cloudfoundry.services.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="thinkonweb.bean.Member"/>
<jsp:setProperty name="member" property="*"/>
<%
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("password"));
	member.setEmail(request.getParameter("email"));
	String sql="INSERT INTO users(username,password,email) VALUES('"+member.getId() + "','"+member.getPassword()+"','"+member.getEmail()+"');";
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	stmt.executeUpdate(sql);

	session.setAttribute("loginid",member.getId());
	response.sendRedirect("/");
	

	ResultSet rs=stmt.executeQuery("select * from users");
	while(rs.next()){
	out.println("user : "+rs.getString("username")+","+rs.getString("password")+"<br>");
}
	conn.close();
	
%>
