<%--
  Created by IntelliJ IDEA.
  User: Q1
  Date: 2018-12-06
  Time: 오후 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="utils.SessionUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%
    SessionUtils sessionUtils = new SessionUtils();
    String sessionId = sessionUtils.getSession(request, "sessionId");
    System.out.println(sessionId);
    sessionUtils.removeSession(request, sessionId);
    PrintWriter out1 = response.getWriter();
    out1.print("<script language=javascript>");
    out1.print(" self.window.alert(\"로그아웃이 되었습니다.\");");
    out1.print("location.href=\"javascript:history.back()\";");
    out1.print("</script>");
    out1.close();
%>
