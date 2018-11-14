<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 19.
  Time: PM 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao" %>
<%@include file="include/common.jsp"%>
<%
    BoardDao boardDao = new BoardDao();
    boardDao.sqlInsert(request, response, "post");
%>
