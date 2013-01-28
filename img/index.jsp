<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*,javax.sql.*"%>
<%@page import="org.cloudfoundry.services.*"%>
<jsp:include page="Header.jsp"  />
<%
 
 ServiceManager services =ServiceManager.INSTANCE;
  Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
  String mpage=request.getParameter("page");
  int curPage;
  if(mpage == null){curPage=1;} else{curPage=Integer.parseInt(mpage);}
  int offset=(curPage-1)*3;
  String sql="select * from posts order by post_id desc LIMIT 3 OFFSET " + offset;
  Statement stmt =conn.createStatement();
  ResultSet rs=stmt.executeQuery(sql);

  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyy-MM-dd HH:mm:ss");
  sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
  while(rs.next()){
    out.println("<div class='post'>");
    out.println("<h2><a href='post.jsp?id="+rs.getInt("post_id")+"'>"+rs.getString("post_title")+"</a></h2>");
    out.println("<p>"+rs.getString("post_content")+"</p>");
    out.println("<p>작성자"+rs.getString("post_author")+"</p>");
    out.println("<p>작성시간"+sdf.format(rs.getTimestamp("post_date"))+"</p>");
    out.println("</div>");

    }
    
  %>
  <%
  sql="select count(*) as cnt from posts";
  rs=stmt.executeQuery(sql); rs.next();
  int totalCount=rs.getInt(1);
  int pageSize=3;
  int totalPage = (int)Math.ceil((double)totalCount/pageSize);
  conn.close();
  %>
  <hr>
  <div class="pagination pagination-centered pagination-large">
    <ul>
      <%
      if(curPage>1)
        out.println("<li><a href='?page"+(curPage-1)+"'> &larr; 이전 </a></li>");
      for(int i=1;i<=totalPage;i++){
        if(i==curPage){
      out.println("<li class='active'><a href='?page="+i+"'>"+i+"</a></li>");
    }else{
    out.println("<li><a href='?page="+i+"'>"+i+"</a></li>");
  }
}
if(curPage<totalPage)
  out.println("<li><a href='?page="+(curPage+1)+"'>다음 &rarr; </a></li>");
%>
</ul>
</div>

    
  <jsp:include page="footer.jsp"  />