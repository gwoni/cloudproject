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
	BoxExternalAPI iBoxExternalAPI = new SimpleBoxImpl();
	String API_KEY=application.getInitParameter("bnetAppKey");
	
	String TICKET;	
	
	GetTicketRequest getTicketRequest = BoxRequestFactory.createGetTicketRequest(API_KEY);
    GetTicketResponse getTicketResponse = iBoxExternalAPI.getTicket(getTicketRequest);

    TICKET=getTicketResponse.getTicket();
    
    GetAuthTokenRequest getAuthTokenRequest = BoxRequestFactory.createGetAuthTokenRequest(API_KEY, getTicketResponse.getTicket());
    GetAuthTokenResponse getAuthTokenResponse = iBoxExternalAPI.getAuthToken(getAuthTokenRequest);      
    
    String authToken = getAuthTokenResponse.getAuthToken();
    
//	Fix it from here

	String[] params = { "nozip" };
	GetAccountTreeRequest getAccountTreeRequest = BoxRequestFactory.createGetAccountTreeRequest(API_KEY, authToken, "0", params);
	iBoxExternalAPI.getAccountTree(getAccountTreeRequest);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Connect Box.net continue</title>
</head>
<body>

</body>
</html>