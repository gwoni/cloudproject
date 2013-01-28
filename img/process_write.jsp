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
  String id = (String)session.getAttribute("loginid");
  String title = request.getParameter("title");
  String content= request.getParameter("content");
  if((title=="") || (content=="")) {response.sendRedirect("/"); return;}
  ServiceManager services =ServiceManager.INSTANCE;
  Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
  String sql="INSERT INTO posts(post_author,post_date,post_title,post_content) VALUES(?,?,?,?);";
  PreparedStatement pstmt=conn.prepareStatement(sql);
  pstmt.setString(1,id);
  pstmt.setTimestamp(2,new java.sql.Timestamp(new java.util.Date().getTime()));
  pstmt.setString(3,title);
  pstmt.setString(4,content);
  pstmt.executeUpdate();
  pstmt.close();

  response.sendRedirect("/");
  conn.close();
  
%>
