<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 21/11/2018
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.SessionUtils" %>
<%
    String sessionId = new SessionUtils().getSession(request, "sessionId");
    if (sessionId != null) {
%>
<jsp:include page="left_menu/header.jsp"></jsp:include>
<%
    } else {
%>

<%
    }
%>
<jsp:include page="left_menu/footer.jsp"></jsp:include>



