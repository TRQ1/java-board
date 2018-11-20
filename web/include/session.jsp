<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 20/11/2018
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="utils.SessionUtils" %>
<%
    String userId = new SessionUtils().getSession(request, "sessionId");
%>
