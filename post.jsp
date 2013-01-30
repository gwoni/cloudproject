<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*,javax.sql.*"%>
<%@page import="org.cloudfoundry.services.*"%>
<jsp:include page="Header.jsp"  />
<%
 
 ServiceManager services =ServiceManager.INSTANCE;
  Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
  
  String post_id=request.getParameter("id");
  String sql="select * from posts where post_id ="+post_id;
  if(post_id == null) 
      response.sendRedirect("/");
  Statement stmt =conn.createStatement();
  ResultSet rs=stmt.executeQuery(sql);

  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyy-MM-dd HH:mm:ss");
  sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
  while(rs.next()){
    out.println("<div class='post'>");
    out.println("<h2>" + rs.getString("post_title")+"</h2>");
    out.println("<p>"+rs.getString("post_content")+"</p>");
    out.println("<p>작성자"+rs.getString("post_author")+"</p>");
    out.println("<p>작성시간"+sdf.format(rs.getTimestamp("post_date"))+"</p>");


    out.println("</div>");

    }
   %>
  <hr>
  <%
   sql="select * from comments where post_id ="+post_id;
   rs = stmt.executeQuery(sql);
   while(rs.next()){
   out.println("<div class='comment well'>");
   out.println("<p>" + rs.getString("cmt_comment")+"</p>");
   out.println("<p class='pull-right'>by <b>" + rs.getString("cmt_author")+"</b> at" + sdf.format(rs.getTimestamp("cmt_date"))+"</p>");
   out.println("</div>");

 }
    conn.close();
  %>

    <hr>
  <%
    String id = (String)session.getAttribute("loginid");
    if(id!=null){
    %>
    <hr>
      <form class="form-write" action="process_cmt_write.jsp" method="post">
        <h4 class="form-write-heading">댓글남기기</h4>
        <label>작성자 : <%=id%></label>
        <input type=hidden name=post_id value="<%=post_id %>" />
        <div class="controls controls-row">
          <textarea class=span10 rows=2 name=content></textarea>
          <button class="btn btn-large btn-primary span2" type="submit">댓글 작성</button>
        </div>
      </form>
      <% }else{ %>
      <hr>
      <div class="alert">
        <b>로그인</b>하시면 댓글을 남기실 수 있습니다.
        <a href="login.jsp" class="btn btn-small">로그인하기</a>
        아이디가 없으시면 <b>가입</b>해주세요
        <a href="register.jsp" class="btn btn-small">가입하기</a>
      </div>
      <% } %>
  }
  <jsp:include page="footer.jsp"  />