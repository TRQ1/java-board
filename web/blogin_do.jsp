<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 10. 15.
  Time: AM 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="utils.CookieUtils" %>
<%
    CookieUtils cookieUtils = new CookieUtils();
    cookieUtils.createCookie(response, "loginId", "null");
    response.sendRedirect("lists.jsp");
%>
