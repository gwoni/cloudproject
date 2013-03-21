<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="thinkonweb.bean.Member" scope="page"/>
<jsp:setProperty name="member" property="*" />
<%
	
	
	String sql="INSERT INTO users(main_id, main_password, main_name) VALUES('"+member.getMain_id() + "','"+member.getMain_password() + "','" +member.getMain_name() + "');";
	String dropbox_sql="INSERT INTO dropbox(main_id, access_key, access_secret) VALUES('"+member.getMain_id() + "','"+member.getMain_password()+"','" + member.getMain_name() + "');";
	
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.executeUpdate(dropbox_sql);
    
	
	session.setAttribute("loginid",member.getMain_id());
	session.setAttribute("loginname",member.getMain_name());
	
	response.sendRedirect("/connect.jsp");
	

	ResultSet rs=stmt.executeQuery("select * from users");
	
	while(rs.next()){
		out.println("user : "+rs.getString("main_id")+","+rs.getString("main_password")+"<br>");
	}
	stmt.close();
	conn.close();
	
%>
