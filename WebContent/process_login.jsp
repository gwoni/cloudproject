<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="org.cloudfoundry.services.*" %>

<jsp:useBean id="member" class="thinkonweb.bean.Member" scope="page"/>
<jsp:setProperty name="member" property="*"  />


<%
	ServiceManager services=ServiceManager.INSTANCE;
	Connection conn=(Connection)services.getInstance(CloudFoundryServices.MYSQL);
	
	Statement stmt=conn.createStatement();
	String sql = "select count(*) as cnt from users where main_id='" + member.getMain_id() + "' and main_password='"+member.getMain_password()+"';";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
		
		if(rs.getInt("cnt")<1)
			response.sendRedirect("/login.jsp");
		else{
			
			session.setAttribute("loginid",member.getMain_id());
			session.setAttribute("loginname",member.getMain_name());
			boolean Dropbox_update=false;
			session.setAttribute("Dropbox_update",Dropbox_update);
			long size=0;
			session.setAttribute("total",size);
			session.setAttribute("use",size);
			response.sendRedirect("/connect.jsp");
			
			
			
		}
	}
	stmt.close();
	conn.close();	
%>