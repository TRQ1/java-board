<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="include/common.jsp" %>
<%@ include file="include/session.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    int pg = Integer.parseInt(request.getParameter("pg"));
%>
<%
    if(userAuth !=null && userAuth == "admin") {
%>
<jsp:include page="manager.jsp"/>
<%
    } else if(userId != null) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="userAuth" value="<%=userAuth%>"/>
</jsp:include>
<%
    } else if(userId == null) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="pg" value="<%=pg%>"/>
</jsp:include>
<%
    }
%>
