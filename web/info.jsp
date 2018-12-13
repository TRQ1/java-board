<%--
  Created by IntelliJ IDEA.
  User: Q1
  Date: 2018-12-06
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.SessionUtils" %>
<%
    String sessionId = new SessionUtils().getSession(request, "sessionId");
    if (sessionId != null && sessionId.equals("vistor")) {
        sessionId = "방문자";
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr height="5">Welcome to <%=sessionId%>
        <td width="5"></td>
    </tr>
    <%
        if (sessionId != null && sessionId.equals("방문자")) {
        } else {
    %>
    <form name=logout method=post action="logout_do.jsp">
        <input type="submit" value="Log Out"/>
    </form>
    <%
        }
    %>
</table>

</body>
</html>
