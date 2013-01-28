<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="org.cloudfoundry.services.*" %>

<jsp:useBean id="member" class="thinkonweb.bean.Member"/>
<jsp:setProperty name="member" property="*"/>

<%
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);

	Statement stmt=conn.createStatement();
	String sql = "select count(*) as cnt from users where username='" + member.getId() + "' and password='"+member.getPassword()+"';";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
		if(rs.getInt("cnt")<1){
%>
<center>로그인 실패</center>
<script>setTimeout(function(){
	history.go(-1);

}, 1000);</script>
<%
}else{
	session.setAttribute("loginid",member.getId());
	response.sendRedirect("/");
}
	conn.close();
%>