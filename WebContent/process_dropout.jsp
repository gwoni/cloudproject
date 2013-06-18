<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="org.cloudfoundry.services.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.*" %>

<jsp:useBean id="memberQuery" class="thinkonweb.bean.MemberQuery" ></jsp:useBean>

<%
	String main_id;
	main_id=(String)session.getAttribute("loginid");
	
	
	memberQuery.memberDelete(main_id);
		
	DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
	if(mdb!=null){
		if(mdb.getSession().isLinked()==true ){
 			mdb.getSession().unlink();
 		}
	}

	session.invalidate();
	response.sendRedirect("/index.jsp");
%>
