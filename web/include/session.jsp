<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 20/11/2018
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.SessionUtils" %>
<%@ page import="utils.Login" %>
<%
    String userId = new SessionUtils().getSession(request, "sessionId");
    System.out.println(userId);
    String userAuth = new Login().checkAuth(request, response, userId);
    System.out.println(userAuth);
    int boardCode = 0;
%>
