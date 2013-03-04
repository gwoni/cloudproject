<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="org.cloudfoundry.services.*" %>
<html>
<body>
<%
	
	String msg=null;
	String sql="SELECT 'hello jspbookdb!' AS msg";
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	PreparedStatement pstmt =conn.prepareStatement(sql);
	
	ResultSet rs= pstmt.executeQuery();
	if(rs.next())
		msg=rs.getString("msg");
	rs.close();
	pstmt.close();
%>

쿼리문		: <%=sql %><br/>
쿼리 결과	: <%=msg %><br/>
</body>
</html>