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
  String post_id = request.getParameter("post_id");
  String content= request.getParameter("content");
 
  ServiceManager services =ServiceManager.INSTANCE;
  Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
  String sql="INSERT INTO comments(cmt_author,cmt_date,cmt_comment,post_id) VALUES(?,?,?,?);";
  PreparedStatement pstmt=conn.prepareStatement(sql);
  pstmt.setString(1,id);
  pstmt.setTimestamp(2,new java.sql.Timestamp(new java.util.Date().getTime()));
  pstmt.setString(3,content);
  pstmt.setString(4,post_id);
  pstmt.executeUpdate();
  pstmt.close();

  
  conn.close();
  response.sendRedirect("/post.jsp?id="+post_id);
  
%>
