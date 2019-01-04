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
    try {
    int bc = 0;
    int w = 0;
    int d = 0;
    int opt = 0;
    String condition = null;
    int id = Integer.parseInt(request.getParameter("id"));
    int pg = Integer.parseInt(request.getParameter("pg"));

    if(request.getParameter("bc") != null) {
        bc = Integer.parseInt(request.getParameter("bc"));
    }
    if (request.getParameter("w") != null) {
        w = Integer.parseInt(request.getParameter("w"));
    }
    if (request.getParameter("d") != null) {
        d = Integer.parseInt(request.getParameter("d"));
    }
    if (request.getParameter("opt") != null){
        opt = Integer.parseInt(request.getParameter("opt"));
    }
    if (request.getParameter("condition") != null){
        condition = request.getParameter("condition");
    }
        System.out.println("w2 : " + w);
        System.out.println(userId);
%>
<%
    if(userAuth !=null && userAuth == "admin" && bc == 0) {
%>
<jsp:include page="manager.jsp"/>
<%
    } else if(w == 1) {
        System.out.println("w3 :" + w);
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
   } else if(userId != null) {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
    <jsp:param name="userAuth" value="<%=userAuth%>"/>
</jsp:include>
<%
    } else {
%>
<jsp:include page="lists.jsp">
    <jsp:param name="id" value="<%=id%>" />
    <jsp:param name="pg" value="<%=pg%>"/>
    <jsp:param name="bc" value="<%=bc%>"/>
    <jsp:param name="opt" value="<%=opt%>"/>
    <jsp:param name="condition" value="<%=condition%>"/>
</jsp:include>
<%
    }
    }catch (Exception e) {
        System.out.println(e);
    }
%>
