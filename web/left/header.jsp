<%@ page import="utils.SessionUtils" %><%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../include/common.jsp" %>
<%@include file="../include/session.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    if(userId == null) {
%>
<jsp:include page="../login.jsp"/>
<%
    } else {
%>
<jsp:include page="../info.jsp"/>
<%
    }
%>
