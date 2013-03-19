<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*" %>
<%@ page import="java.util.*, thinkonweb.bean.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Member View</title>
</head>
<body>

<h3>회원 정도</h3>

<table bordercolor="#0000ff" border="1">
	<tr>
		<td><strong>ID</strong></td>
		<td><strong>NAME</strong></td>
	</tr>
	
	<%
		String msg=null;
		String sql="";
		ServiceManager services=ServiceManager.INSTANCE;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		Vector vecList=new Vector();
		
		try{
			conn=(Connection)services.getInstance(CloudFoundryServices.MYSQL);
			String strQuery="select * from Member";
			stmt =conn.createStatement();
			rs=stmt.executeQuery(strQuery);
			
			while(rs.next()){
				Member member=new Member();
				member.setMain_id(rs.getString("main_id"));
				member.setMain_name(rs.getString("main_name"));
				vecList.add(member);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException ex){}
			}
			if(stmt!=null){
				try{
					stmt.close();
				}catch(SQLException ex){}
			}
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException ex){}
			}
		}
	%>
	
	
 	<jsp:useBean id="memView" class="thinkonweb.bean.MemberMgr" scope="page" />
	
	<%	%>
	
	<tr>
		<td><%= %></td>
	</tr>
</table>

</body>
</html>