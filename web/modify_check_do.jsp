<%--
  Created by IntelliJ IDEA.
  User: TRQ1
  Date: 2018. 9. 20.
  Time: AM 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDao" %>
<%
    request.setCharacterEncoding("UTF-8");
    BoardDao boardDao = new BoardDao();
    boardDao.modifyCheckDo(request, response);
%>