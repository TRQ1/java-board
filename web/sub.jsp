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
    int bc = 0;
    int id = 0;
    int w = 0;
    int d = 0;
    int pg = Integer.parseInt(request.getParameter("pg"));
    if(request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
    if(request.getParameter("bc") != null) {
        bc = Integer.parseInt(request.getParameter("bc"));
    }
    if (request.getParameter("w") != null) {
        w = Integer.parseInt(request.getParameter("w"));
    }
    if (request.getParameter("d") != null) {
        d = Integer.parseInt(request.getParameter("d"));
    }
    System.out.println("d : " + d);
    System.out.println("w : " + w);
%>
<%
    if(userAuth !=null && userAuth == "admin" && bc == 0) {
%>
<jsp:include page="manager.jsp"/>
<%
    } else if(userId != null) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
    <jsp:param name="userAuth" value="<%=userAuth%>"/>
</jsp:include>
<%
    } else if(userId == null) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
</jsp:include>
<%
    } else if(w == 1) {

%>
<jsp:include page="write.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
</jsp:include>
<%
    } else if (d == 1) {
%>
<jsp:include page="detail.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
</jsp:include>
<%
    }
%>
