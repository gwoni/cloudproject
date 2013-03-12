<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*, thinkonweb.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3>회원 정도</h3>

<table bordercolor="#0000ff" border="1">
	<tr>
		<td><strong>ID</strong></td>
		<td><strong>NAME</strong></td>
	</tr>
	
	<jsp:useBean id="memView" class="thinkonweb.bean.MemberMgr" scope="page" />
	
	<%	%>
	
	<tr>
		<td><%= %></td>
	</tr>
</table>

</body>
</html>