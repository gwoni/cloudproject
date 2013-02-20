<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.BoxExternalAPI" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.constant.BoxConstant" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.factories.BoxRequestFactory" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountTreeRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountTreeRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAuthTokenRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAuthTokenResponse" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetTicketRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetTicketResponse" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.LogoutRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.impl.simple.SimpleBoxImpl" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.objects.BoxException" %>

<%@ page import="org.apache.log4j.Logger" %>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "java.awt.*" %>
<%@ page import= "java.net.*" %>

<%
	String API_KEY=application.getInitParameter("bnetAppKey");
	BoxExternalAPI iBoxExternalAPI = new SimpleBoxImpl();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Box.net OAuth</title>
</head>
<body>

<%
	String TICKET;

	try {
			
		GetTicketRequest getTicketRequest = BoxRequestFactory.createGetTicketRequest(API_KEY);
		GetTicketResponse getTicketResponse = iBoxExternalAPI.getTicket(getTicketRequest);
		
		TICKET=getTicketResponse.getTicket();
		String URL="http://www.box.net/api/1.0/auth/"+TICKET;

		response.sendRedirect(URL);
    	GetAuthTokenRequest getAuthTokenRequest = BoxRequestFactory.createGetAuthTokenRequest(API_KEY, getTicketResponse.getTicket());
	    GetAuthTokenResponse getAuthTokenResponse = iBoxExternalAPI.getAuthToken(getAuthTokenRequest);
%>
<%

	    if (BoxConstant.STATUS_NOT_LOGGED_IN.equals(getAuthTokenResponse.getStatus()))
	     	   	return;
    	    
	    String authToken = getAuthTokenResponse.getAuthToken();
	    
		}catch(Exception e){
	    	e.printStackTrace();
	}    	
%>

</body>
</html>