<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="thinkonweb.bean.Member" />
<jsp:setProperty name="member" property="*" />
<jsp:useBean id="memberQuery" class="thinkonweb.bean.MemberQuery" ></jsp:useBean>

<%
	memberQuery.memberInsert(member);

	session.setAttribute("loginid", member.getMain_id());
	session.setAttribute("loginname", member.getMain_name());
	boolean dropbox_update = false;
	session.setAttribute("Dropbox_update",dropbox_update);
		
	response.sendRedirect("/connect.jsp");
%>
