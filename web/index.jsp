<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="include/common.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    int pg = 1;
    int id = 0;
    int bc = 0;
    int w = 0;
    int d = 0;
    int opt = 0;
    String condition = null;

    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }
    if(request.getParameter("pg") != null) {
        pg = Integer.parseInt(request.getParameter("pg"));
    }
    if (request.getParameter("bc") != null){
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
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<div id="TOP" style="width:960px;height:150px;">
</div>
<table width="960px">
    <tr>
        <td width="160" valign="top">
            <jsp:include page="left.jsp"/>
        </td>
        <td width="1000" valign="top">
            <table witdth="100%" cellpadding="0" cellspacing="0" border="0">
                <%
                   if(w == 1)  {
                %>
                <tr>
                    <jsp:include page="sub.jsp">
                        <jsp:param name="bc" value="<%=bc%>" />
                        <jsp:param name="id" value="<%=id%>" />
                        <jsp:param name="pg" value="<%=pg%>"/>
                        <jsp:param name="w" value="<%=w%>"/>
                    </jsp:include>
                </tr>
                <%
                    } else if (d == 1) {
                %>
                <tr>
                    <jsp:include page="sub.jsp">
                        <jsp:param name="bc" value="<%=bc%>" />
                        <jsp:param name="id" value="<%=id%>" />
                        <jsp:param name="pg" value="<%=pg%>"/>
                        <jsp:param name="d" value="<%=d%>"/>
                    </jsp:include>
                <%
                    } else {
                %>
                <jsp:include page="sub.jsp">
                    <jsp:param name="bc" value="<%=bc%>" />
                    <jsp:param name="id" value="<%=id%>" />
                    <jsp:param name="pg" value="<%=pg%>"/>
                    <jsp:param name="opt" value="<%=opt%>"/>
                    <jsp:param name="condition" value="<%=condition%>"/>
                </jsp:include>
                <%
                    }
                %>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
