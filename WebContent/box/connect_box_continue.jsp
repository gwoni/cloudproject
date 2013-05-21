<%@page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountTreeResponse"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.BoxExternalAPI" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.constant.BoxConstant" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.factories.BoxRequestFactory" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountInfoRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountInfoRequest" %>
<%@ page import="cn.com.believer.songyuanframework.openapi.storage.box.functions.GetAccountInfoResponse" %>
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
    
    try{
    	GetTicketRequest getTicketRequest = BoxRequestFactory.createGetTicketRequest(API_KEY);
        GetTicketResponse getTicketResponse = iBoxExternalAPI.getTicket(getTicketRequest);
        
        TICKET=getTicketResponse.getTicket();
        
        GetAuthTokenRequest getAuthTokenRequest = BoxRequestFactory.createGetAuthTokenRequest(API_KEY, TICKET);
        GetAuthTokenResponse getAuthTokenResponse = iBoxExternalAPI.getAuthToken(getAuthTokenRequest);

        if (BoxConstant.STATUS_NOT_LOGGED_IN.equals(getAuthTokenResponse.getStatus())) {
            return;
        }
        String authToken = getAuthTokenResponse.getAuthToken();
        
        String[] params = { "nozip", "simple" };
        GetAccountTreeRequest getAccountTreeRequest = BoxRequestFactory.createGetAccountTreeRequest(API_KEY, authToken, "0", params);
        
        GetAccountTreeResponse getAccountTreeResponse=iBoxExternalAPI.getAccountTree(getAccountTreeRequest);
        
        
        System.out.println(getAccountTreeResponse.getStatus());

        // test get_account_info
        GetAccountInfoRequest getAccountInfoRequest = BoxRequestFactory.createGetAccountInfoRequest(API_KEY,
                authToken);
        GetAccountInfoResponse getAccountInfoResponse = iBoxExternalAPI.getAccountInfo(getAccountInfoRequest);

        System.out.println(getAccountInfoResponse.getStatus());
        
    }catch(Exception ex){
    	
    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Connect Box.net continue</title>
</head>
<body>

</body>
</html>